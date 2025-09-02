table 50105 Category
{
    Caption = 'Category';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
            AutoIncrement = true;
        }
        field(2; "Name"; Text[30])
        {
            Caption = 'Name ';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }

    }

    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Name) { }
    }


}
