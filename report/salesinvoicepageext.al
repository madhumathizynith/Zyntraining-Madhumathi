pageextension 50132 SalesInvoiceListExt extends "Sales Invoice list"
{
    actions
    {
        addlast(Processing)
        {
            action(BulkPostInvoices)
            {
                ApplicationArea = All;
                Caption = 'Bulk Post Invoices';
                trigger OnAction()
                var
                    invoicereport: Report "Invoice report";
                begin
                    Report.RunModal(Report::"Invoice report");
                end;
            }
        }
    }
}
