report 50101 "Customer Report"
{
    ApplicationArea = All;
    Caption = 'Customer Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = CustomerReport;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.") { }
            column(SellToCustomerName; "Sell-to Customer Name") { }
            column(DocumentDate; "Document Date") { }
            column(PostingDate; "Posting Date") { }

            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");

                column(Amount; Amount) { }
                column(Quantity; Quantity) { }
                column(Description; Description) { }
                column(LineAmount; "Line Amount") { }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    // Example: Add a filter or option

                }
            }
        }

        actions
        {
            area(Processing)
            {
                // Optional: Add processing actions
            }
        }
    }

    rendering
    {
        layout(CustomerReport)
        {
            Type = RDLC;
            LayoutFile = './report/cust.rdl'; // <-- Ensure RDLC file is added in your project folder
        }
    }
}
