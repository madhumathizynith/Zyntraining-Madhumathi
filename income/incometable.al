table 50117 "Income Table"
{
    Caption = 'Income Table';


    fields
    {
        field(1; "Income Id"; Code[20])
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
        key(PK; "Income Id")
        {
            Clustered = true;
        }
    }
}

