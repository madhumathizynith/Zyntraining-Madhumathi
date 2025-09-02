pageextension 50130 Customerfactbox extends "Customer Card"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(OpenInvoicesFactBox; "Open Invoices")
            {
                ApplicationArea = All;
                SubPageLink = "Sell-to Customer No." = FIELD("No.");
            }
            part(OpenOrdersFactBox; "Open Orders")
            {
                ApplicationArea = All;
                SubPageLink = "Sell-to Customer No." = FIELD("No.");
            }
        }
    }
}
