table 50192 "Revenue Cue"
{
    Caption = 'Revenue Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer) { AutoIncrement = true; }
        field(2; "Revenue This Month"; Decimal)
        {

            Caption = 'Revenue this month';
        }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
}
page 50193 "Revenue Cuepage"
{
    PageType = CardPart;
    SourceTable = "Revenue Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Revenue)
            {
                field("Revenue This Month"; Rec."Revenue This Month")
                {
                    Caption = 'Revenue Generated';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        EnsureCueRecordExists();
        CalculateRevenue();
    end;

    local procedure EnsureCueRecordExists()
    begin
        // Do not attempt to set AutoIncrement field value manually.
        // If there are no records, insert one and then read it back.
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert(true); // insert and set Rec to the inserted record
        end;
    end;

    local procedure CalculateRevenue()
    var
        SalesLine: Record "Sales Line";
        StartDate: Date;
        EndDate: Date;
        SumAmt: Decimal;
    begin
        // Start of current month (day 1 of WorkDate's month)
        StartDate := DMY2DATE(1, Date2DMY(WorkDate, 2), Date2DMY(WorkDate, 3));
        // End of current month: add one month then subtract one day
        EndDate := CALCDATE('+1M-1D', StartDate);

        SumAmt := 0;

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
        SalesLine.SetRange("Posting Date", StartDate, EndDate);

        // Use CalcSums for performance instead of looping
        if SalesLine.FindSet() then begin
            SalesLine.CalcSums("Amount");
            SumAmt := SalesLine."Amount";
        end;

        // Ensure we have the cue record loaded in Rec before modifying
        if not Rec.FindFirst() then begin
            // Defensive: if somehow no record exists, create one
            Rec.Init();
            Rec.Insert(true);
        end;

        Rec."Revenue This Month" := SumAmt;
        Rec.Modify();
    end;
}