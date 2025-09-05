codeunit 50168 "Subscription Job"
{
    trigger OnRun()

    var
        JobBill: Codeunit "Subscription Codeunit";
        Created: Integer;
    begin
        created := JobBill.Billing();
    end;

    var
        myInt: Integer;
}