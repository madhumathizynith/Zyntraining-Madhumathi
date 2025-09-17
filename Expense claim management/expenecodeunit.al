codeunit 50192 "Expense codeunit"
{
    procedure CalcAvailableAmount(var Claim: Record "Expense Claim Table")
    var
        ClaimRec: Record "Expense Claim Table";
        CategoryRec: Record "Expense Claim Category";
        TotalApproved: Decimal;
        Remaining: Decimal;
    begin
        if Claim."Category Code" = '' then
            exit;
        if not CategoryRec.Get(Claim."Category Code") then
            exit;

        // Sum approved claims
        TotalApproved := 0;
        ClaimRec.Reset();
        ClaimRec.SetRange("Category Code", Claim."Category Code");
        ClaimRec.SetRange(Status, ClaimRec.Status::Approved);
        if ClaimRec.FindSet() then
            repeat
                TotalApproved += ClaimRec.Amount;
            until ClaimRec.Next() = 0;

        Remaining := CategoryRec."Amount Limit" - TotalApproved;
        if Remaining < 0 then
            Remaining := 0;

        // Update available amount for all claims in this category
        ClaimRec.Reset();
        ClaimRec.SetRange("Category Code", Claim."Category Code");
        if ClaimRec.FindSet() then
            repeat
                ClaimRec."Available amount" := Remaining;
                ClaimRec.Modify(true);
            until ClaimRec.Next() = 0;
    end;
}
