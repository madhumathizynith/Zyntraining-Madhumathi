table 50108 "Budget Table"
{
    Caption = 'Budget Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(2; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(3; "Expense Category"; Text[100])
        {
            Caption = 'Expense Category';
        }
        field(4; "Budget Amount"; Decimal)
        {
            Caption = 'Budget Amount';
        }
    }
    keys
    {
        key(PK; "Expense Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Drilldown; "Expense Category")
        {

        }
    }




}