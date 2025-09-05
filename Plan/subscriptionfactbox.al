table 50188 SubscriptionCue
{


    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; count; Integer)
        {
            FieldClass = Flowfield;
            CalcFormula = count("Customer Subscription" where("Subscription Status" = const(Active)));
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}

page 50187 Subscriptioncuepage
{
    PageType = Cardpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SubscriptionCue;

    layout
    {
        area(Content)
        {
            cuegroup(ActiveSubscribers)
            {
                field(count; Rec.count)

                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Subscription List";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }

    }

    var
        myInt: Integer;

    trigger OnOpenPage()
    var
        R: Record SubscriptionCue;
    begin
        if not R.FindFirst() then begin
            R.Init();
            R.Insert();              // create singleton
        end;
        CurrPage.SetRecord(R);       // bind the record to the CardPart
    end;
}

pageextension 50190 cueext extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ActiveSubscribers; Subscriptioncuepage)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}