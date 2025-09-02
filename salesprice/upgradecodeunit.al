codeunit 50111 "Last Sold Price Upgrade"
{
    Subtype = Upgrade;
    trigger OnUpgradePerCompany()
    var
        Upgradetag: Codeunit "Upgrade Tag";
        SalesInvLine: Record "Sales Invoice Line";
        LastSoldRec: Record "Sales Price Table";
        TempLastSold: Record "Sales Price Table" temporary;
        TagId: Code[250];
    begin
        TagId := 'LastSoldPrice_InitialUpgrade';
        if Upgradetag.HasUpgradeTag(TagId) then
            exit;

        // Step 1: Collect last sold price per Customer–Item
        SalesInvLine.Reset();
        SalesInvLine.SetCurrentKey("Sell-to Customer No.", "No.", "Posting Date");

        if SalesInvLine.FindSet() then
            repeat
                if SalesInvLine.Type = SalesInvLine.Type::Item then begin
                    if TempLastSold.Get(SalesInvLine."Sell-to Customer No.", SalesInvLine."No.") then begin
                        if SalesInvLine."Posting Date" > TempLastSold."Posting Date" then begin
                            TempLastSold.Validate("LastItem Sold Price", SalesInvLine."Unit Price");
                            TempLastSold.Validate("Posting Date", SalesInvLine."Posting Date");
                            TempLastSold.Modify();
                        end;
                    end else begin
                        TempLastSold.Init();
                        TempLastSold.Validate("Customer No", SalesInvLine."Sell-to Customer No.");
                        TempLastSold.Validate("Item No", SalesInvLine."No.");
                        TempLastSold.Validate("LastItem Sold Price", SalesInvLine."Unit Price");
                        TempLastSold.Validate("Posting Date", SalesInvLine."Posting Date");
                        TempLastSold.Insert();
                    end;
                end;
            until SalesInvLine.Next() = 0;

        // Step 2: Save to actual table
        if TempLastSold.FindSet() then
            repeat
                if LastSoldRec.Get(TempLastSold."Customer No", TempLastSold."Item No") then begin
                    LastSoldRec.Validate("LastItem Sold Price", TempLastSold."LastItem Sold Price");
                    LastSoldRec.Validate("Posting Date", TempLastSold."Posting Date");
                    LastSoldRec.Modify(true);
                end else begin
                    LastSoldRec.Init();
                    LastSoldRec.Validate("Customer No", TempLastSold."Customer No");
                    LastSoldRec.Validate("Item No", TempLastSold."Item No");
                    LastSoldRec.Validate("LastItem Sold Price", TempLastSold."LastItem Sold Price");
                    LastSoldRec.Validate("Posting Date", TempLastSold."Posting Date");
                    LastSoldRec.Insert(true);
                end;
            until TempLastSold.Next() = 0;

        if not UpgradeTag.HasUpgradeTag(TagId) then begin
            // your upgrade logic here

            UpgradeTag.SetUpgradeTag(TagId);
        end;


    end;
}

