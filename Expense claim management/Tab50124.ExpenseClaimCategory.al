table 50124 "Expense Claim Category"
{
    Caption = 'Expense Claim Category';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code "; COde[20])
        {
            Caption = 'Code ';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Subtype; Text[100])
        {
            Caption = 'Subtype';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Amount Limit"; Decimal)
        {
            Caption = 'Amount Limit';
        }
    }
    keys
    {
        key(PK; "Code ")
        {
            Clustered = true;
        }
    }
}
