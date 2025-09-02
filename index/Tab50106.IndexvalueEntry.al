table 50106 "Index value Entry"
{
    Caption = 'Index value Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; code[10])
        {
            Caption = 'Code';
        }
        field(2; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(3; "Value"; Decimal)
        {
            Caption = 'Value';
        }
        field(4; Year; Integer)
        {
            Caption = 'Year';
        }
    }
    keys
    {
        key(PK; "Code", "Entry No")
        {
            Clustered = true;
        }
    }
}
