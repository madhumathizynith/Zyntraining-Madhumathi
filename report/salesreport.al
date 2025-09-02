report 50107 salesreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Sales report';

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Order), Status = const(Open));
            trigger OnAfterGetRecord()

            begin
                SalesHeader."Posting Date" := NewPostingDate;
                SalesHeader.Modify();
                counting += 1;


            end;

            trigger OnPostDataItem()

            begin
                Message('%1 no of orders dates are updated', count);
            end;

        }
    }


    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Postingreport)
                {
                    field(NewPostingDate; NewPostingDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }


    }


    var
        counting: Integer;
        NewPostingDate: Date;
}