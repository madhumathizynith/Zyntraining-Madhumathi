table 50120 "Plan Table"
{
    Caption = 'Plan Table';


    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
            AutoIncrement = True;
            DataClassification = CustomerContent;
        }
        field(2; "Plan ID"; Code[20])
        {
            Caption = 'Plan ID';
            DataClassification = CustomerContent;

        }
        field(3; "Plan Name"; Text[50])
        {
            Caption = 'Plan Name';
        }
        field(4; "Monthly Fee"; Decimal)
        {
            Caption = 'Monthly Fee';
        }
        field(5; "Plan Status"; Enum "Plan Status")
        {
            Caption = 'Plan Status';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }

    }
    keys
    {
        key(PK; "Plan ID")
        {
            Clustered = true;
        }

    }
}

enum 50199 "Plan Status"
{
    Extensible = true;

    value(0; Active)
    {
        Caption = 'Active';
    }
    value(1; InActive)
    {
        Caption = 'InActive';
    }
}




