codeunit 50166 "Subscription Codeunit"
{
    trigger OnRun()
    begin
        // When executed directly (e.g., by Job Queue), run Billing()
        Billing();
    end;

    procedure Billing(): Integer
    var
        PlanSubscription: Record "Customer Subscription";
        CreatedCount: Integer;
    begin
        // Filter Active subscriptions due today or earlier
        PlanSubscription.SetRange("Subscription Status", PlanSubscription."Subscription Status"::Active);
        PlanSubscription.SetFilter("Next Bill date", '..%1', WorkDate);

        if PlanSubscription.FindSet(true) then
            repeat
                // Skip if subscription ended
                if (PlanSubscription."End Date" <> 0D) and (PlanSubscription."End Date" < WorkDate) then begin
                    // Skip
                end else begin
                    if UnpostedInvoice(PlanSubscription) then begin
                        CreatedCount += 1;

                        // Move next bill date forward (monthly example)
                        if PlanSubscription."Next Bill date" = 0D then
                            PlanSubscription."Next Bill date" := WorkDate;
                        PlanSubscription."Next Bill date" := CalcDate('<1M>', PlanSubscription."Next Bill date");

                        // Expire if beyond End Date
                        if (PlanSubscription."End Date" <> 0D) and
                           (PlanSubscription."Next Bill date" > PlanSubscription."End Date") then
                            PlanSubscription."Subscription Status" := PlanSubscription."Subscription Status"::Expired;

                        PlanSubscription.Modify(true);
                    end;
                end;
            until PlanSubscription.Next() = 0;

        exit(CreatedCount);
    end;


    local procedure UnpostedInvoice(var sub: Record "Customer Subscription"): Boolean
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Plan: Record "Plan Table";
    begin
        // Create Sales Invoice Header
        SalesHeader.Init();
        SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Invoice);
        SalesHeader.Validate("Sell-to Customer No.", sub."Customer ID");
        SalesHeader.Validate("Posting Date", WorkDate);
        SalesHeader.Validate("Document Date", WorkDate);
        SalesHeader."From Subscription" := true;
        SalesHeader.Insert(true);

        // Fetch Plan details
        if not Plan.Get(sub."Plan ID") then
            Error('Plan ID %1 not found.', sub."Plan ID");

        // Add Sales Line
        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine.Validate("Type", SalesLine.Type::"G/L Account");
        SalesLine.Validate("No.", '60100'); // Make sure this G/L Account exists
        SalesLine.Validate("Description", 'Subscription Fee');
        SalesLine.Validate("Quantity", 1);
        SalesLine.Validate("Unit Price", Plan."Monthly Fee");
        SalesLine.Insert(true);

        exit(true);
    end;
}

pageextension 50170 SubscriptionListExt extends "Subscription List"
{
    actions
    {
        addlast(Processing)
        {
            action(RunSubscriptionBilling)
            {
                ApplicationArea = All;
                Caption = 'Run Subscription Billing';


                trigger OnAction()
                var
                    SubCodeunit: Codeunit "Subscription Codeunit";
                    Created: Integer;
                begin
                    Created := SubCodeunit.Billing();
                    Message('Billing finished. Headers created: %1', Created);
                end;
            }
        }
    }
}
