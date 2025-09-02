codeunit 50132 "Sales Price code"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', false, false)]
    local procedure OnAfterSalesInvLineInsert(
        var SalesInvLine: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Line";
        ItemLedgShptEntryNo: Integer;
        WhseShip: Boolean;
        WhseReceive: Boolean;
        CommitIsSuppressed: Boolean;
        var SalesHeader: Record "Sales Header";
        var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary;
        var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary;
        var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary;
        PreviewMode: Boolean)
    var
        LastSoldRec: Record "Sales Price Table";
    begin
        // Only store for Items
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        LastSoldRec.Reset();
        LastSoldRec.SetCurrentKey("Customer No", "Item No", "Posting Date");
        LastSoldRec.SetRange("Customer No", SalesInvLine."Sell-to Customer No.");
        LastSoldRec.SetRange("Item No", SalesInvLine."No.");
        LastSoldRec.SetRange("Sell-to Customer Name", SalesInvLine."Sell-to Customer Name");

        if LastSoldRec.FindLast() then begin
            // Update existing record
            LastSoldRec.Validate("LastItem Sold Price", SalesInvLine."Unit Price");
            LastSoldRec.Validate("Posting Date", SalesInvLine."Posting Date");
            LastSoldRec.Modify(true);
        end else begin
            // Insert new record
            LastSoldRec.Init();
            LastSoldRec.Validate("Customer No", SalesInvLine."Sell-to Customer No.");
            LastSoldRec.Validate("Item No", SalesInvLine."No.");
            LastSoldRec.Validate("LastItem Sold Price", SalesInvLine."Unit Price");
            LastSoldRec.Validate("Posting Date", SalesInvLine."Posting Date");
            LastSoldRec.Validate("Sell-to Customer Name", SalesInvLine."Sell-to Customer Name");
            LastSoldRec.Insert(true);
        end;
    end;
}