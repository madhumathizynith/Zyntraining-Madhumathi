report 50129 "Sales_InvoiceHeaderandLine"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Sales_InvoiceHeader_InvoiceLine.rdl';


    dataset
    {
        dataitem("SalesInvHeader"; "Sales Invoice Header")
        {
            // DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            // PrintOnlyIfDetail = true;
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(Posting_Date; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(Document_Date; "Document Date")
            {
                IncludeCaption = true;
            }
            dataitem("SalesInvLine"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = field("No.");
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
                // column(Amount; Amount)
                // {
                //     IncludeCaption = true;
                // }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(Unit_Price; "Unit Price")
                {
                    IncludeCaption = true;
                }
                column(Line_Amount; "Line Amount")
                {
                    IncludeCaption = true;
                }
                dataitem("Company Information"; "Company Information")
                {
                    column(Company_Name; Name)
                    {
                        IncludeCaption = true;
                    }
                    column(logo; Picture)
                    {
                        IncludeCaption = true;
                    }
                    column(Address; Address)
                    {
                        IncludeCaption = true;
                    }
                }
            }
        }
    }






    // labels
    // {
    //     Sales_Document = 'Sales Document';
    //     Total = 'Total';
    // }

}