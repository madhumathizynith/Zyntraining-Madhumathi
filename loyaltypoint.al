codeunit 50102 "Loyalty Points Handler"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
     SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean;
     InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        CustomerRec: Record Customer;

    begin
        if (SalesHeader."Document Type" <> SalesHeader."Document Type"::Invoice) or
        (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order) then begin


            if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then begin
                CustomerRec."Loyaltypoint" := CustomerRec.Loyaltypoint + 10;
                CustomerRec.Modify();


            end;
        end;
    end;

}

codeunit 50126 "Loyality Points Checker"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean;
     var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    var
        CustomerRec: Record Customer;

    begin
        if (SalesHeader."Document Type" <> SalesHeader."Document Type"::Invoice) or
        (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order) then begin



            if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then begin
                if CustomerRec."Loyaltypoint" >= 100 then
                    Error('Cannot post invoice. Loyalty points (%1) reached for this customer.', CustomerRec."Loyaltypoint");
            end;
        end;
    end;


}


