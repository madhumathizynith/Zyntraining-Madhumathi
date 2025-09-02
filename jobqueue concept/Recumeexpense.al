table 50190 "Resuming Expenses"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Category; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Category.Name;


        }
        field(2; Cycle; Enum Cycle)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()

            begin
                nextcycle();
            end;

        }
        field(3; StartDate; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()

            begin
                nextcycle();
            end;

        }
        field(4; "Next Cycle Date"; Date)
        {
            DataClassification = CustomerContent;


        }

    }

    keys
    {
        key(Pk; Category)
        {
            Clustered = true;
        }
    }
    local procedure nextcycle()


    begin
        if StartDate = 0D then
            exit;
        case Cycle of
            Cycle::Weekly:
                "Next Cycle Date" := StartDate + 7;
            cycle::Monthly:
                "Next Cycle Date" := CalcDate('+1M', StartDate);
            Cycle::Quaterly:
                "Next Cycle Date" := CalcDate('+3M', StartDate);
            Cycle::Halfyearly:
                "Next Cycle Date" := CalcDate('+6M', StartDate);
        end;
    end;
}
enum 50193 Cycle
{
    Extensible = true;

    value(1; Weekly)
    {
        caption = 'Weekly';
    }
    value(2; Monthly)
    {
        caption = 'Monthly';
    }
    value(3; Halfyearly)
    {
        caption = 'Halfyearly';
    }
    value(4; Quaterly)
    {
        caption = 'Quaterly';
    }
}


