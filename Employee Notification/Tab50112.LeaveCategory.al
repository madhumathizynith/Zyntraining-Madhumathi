table 50112 "Leave Category"
{
    Caption = 'Leave Category';


    fields
    {
        field(1; "Leave Category"; Enum "Leave Category")
        {
            Caption = 'Leave Category';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "No. of days allowed"; Integer)
        {
            Caption = 'No. of days allowed';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Leave Category")
        {
            Clustered = true;
        }
    }
}

enum 50178 "Leave Category"
{
    Extensible = true;

    value(1; Sick)
    {
        Caption = 'Sick';
    }
    value(2; Casual)
    {
        Caption = 'Casual';
    }
    value(3; Medical)
    {
        Caption = 'Medical';
    }
    value(4; "Paid Leave")
    {
        Caption = 'Paid Leave';
    }

}