codeunit 50103 "Purchase Post Check"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', false, false)]
    local procedure CheckApprovalStatus(PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."Purchase Approval Status" <> PurchaseHeader."Purchase Approval Status"::Approved then
            Error('You cannot post this Purchase Order because it is not approved.');
    end;
}

enum 50111 "Purchase Header Status"
{
    value(0; "Open")
    {
        Caption = 'Open';

    }
    value(1; "Pending")
    {
        Caption = 'Pending';

    }
    value(2; "Approved")
    {
        Caption = 'Approved';

    }
    value(3; "Escalated")
    {
        Caption = 'Escalated';
    }
}


