table 50107 "Expense Table"
{
    Caption = 'Expense Table';


    fields
    {
        field(1; "Expense Id"; Code[20])
        {
            Caption = 'Expense Id';
            DataClassification = CustomerContent;

        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(5; Category; text[20])
        {
            Caption = 'Category';
            DataClassification = CustomerContent;
            TableRelation = Category.Name;

        }
    }
    keys
    {
        key(PK; "Expense Id")
        {
            Clustered = true;
        }
    }
}
