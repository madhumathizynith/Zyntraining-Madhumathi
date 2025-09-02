table 50100 "Index table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Start year"; Integer) { }
        field(3; "End year"; Integer) { }
        field(4; "Percent increase"; Decimal) { }
        field(5; Description; Text[100]) { }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
    }

    trigger OnInsert()
    begin
        valuecalculate();
    end;

    trigger OnModify()
    begin
        valuecalculate();
    end;

    local procedure valuecalculate()
    var
        IndexValueEntry: Record "Index value Entry";
        CurrentYear: Integer;
        CurrentValue: Decimal;
        EntryNo: Integer;
    begin
        // Delete existing entries for this code to avoid duplicates
        IndexValueEntry.SetRange("Code", Rec."Code");
        IndexValueEntry.DeleteAll();

        CurrentYear := Rec."Start year";
        CurrentValue := 100; // Starting value
        EntryNo := 1;

        while CurrentYear <= Rec."End year" do begin
            IndexValueEntry.Init();
            IndexValueEntry."Code" := Rec."Code";
            IndexValueEntry."Entry No" := EntryNo;
            IndexValueEntry.Year := CurrentYear;
            IndexValueEntry.Value := CurrentValue;
            IndexValueEntry.Insert(true);

            // Calculate next year's value
            CurrentValue := CurrentValue * (1 + Rec."Percent increase" / 100);
            CurrentYear += 1;
            EntryNo += 1;
        end;
    end;
}
