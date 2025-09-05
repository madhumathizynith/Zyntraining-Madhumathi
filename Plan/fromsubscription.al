tableextension 50166 "From Subscription" extends "Sales Header"
{
    fields
    {
        field(50193; "From Subscription"; Boolean)
        {
            Caption = 'From Subscription';
            DataClassification = CustomerContent;
        }

        field(50194; "Subscription Amount"; Decimal)
        {
            Caption = 'Subscription Amount (Planned)';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
    }
}
