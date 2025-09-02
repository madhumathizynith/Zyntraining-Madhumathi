table 50109 "Income Category"
{
    Caption = 'Category';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Name"; Text[30])
        {
            Caption = 'Name ';
        }
        field(2; Description; Text[100])
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



