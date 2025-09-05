table 50122 "Active Subscription Cue"
{
    Caption = 'Active Subscription Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;   // <-- important for singleton
        }
        field(2; "Number of Active Subscriptions"; Integer)
        {
            Caption = 'Number of Active Subscriptions';
            FieldClass = FlowField;
            CalcFormula = count("Customer Subscription"
                                where("Subscription Status" = const(Active)));
        }
    }
    keys { key(PK; "No.") { Clustered = true; } }
}



page 50183 "Active Page"
{
    PageType = CardPart;                  // exact casing
    SourceTable = "Active Subscription Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup("Active Subscription")
            {
                field("Number of Active Subscriptions"; Rec."Number of Active Subscriptions")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    // DrillDownPageId = "Customer Subscription List"; // optional
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        R: Record "Active Subscription Cue";
    begin
        if not R.FindFirst() then begin
            R.Init();
            R.Insert();              // create singleton
        end;
        CurrPage.SetRecord(R);       // bind the record to the CardPart
    end;
}
