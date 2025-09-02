report 50102 "Invoice report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesInvoice; "Sales Header")
        {

            DataItemTableView = where("Document Type" = const(Invoice));
            trigger OnAfterGetRecord()
            var
                SalesPost: Codeunit "Sales-Post";
            begin
                SalesPost.Run(SalesInvoice);

                counting += 1;
            end;

        }
    }

    requestpage
    {
        layout

        {
            area(Content)
            {
                group(postingreport)
                {

                }
            }
        }


    }

    var
        counting: Integer;

    trigger OnPostReport()

    begin
        Message('%1 of invoices posted', counting);
    end;

}