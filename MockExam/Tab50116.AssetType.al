table 50116 "Asset Type"
{
    Caption = 'Asset Type';


    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No.';
        }
        field(2; Category; Enum "Category Type")
        {
            Caption = 'Category';
            DataClassification = CustomerContent;
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}


enum 50119 "Category Type"
{
    Extensible = true;

    value(1; Infreastructure)
    {
        Caption = 'Infrastructure';
    }

    value(2; Electronics)
    {
        Caption = 'Electronics';
    }
    value(3; Documents)
    {
        Caption = 'Documents';
    }
}
