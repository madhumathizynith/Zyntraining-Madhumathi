enum 50191 "Expense Claim Status"
{
    Extensible = true;

    value(0; Pending)
    {
        Caption = 'Pending';
    }
    value(1; Approved)
    {
        Caption = 'Approved';
    }
    value(2; Cancelled)
    {
        Caption = 'Cancelled';
    }
    value(3; Rejected)
    {
        Caption = 'Rejected';
    }
}