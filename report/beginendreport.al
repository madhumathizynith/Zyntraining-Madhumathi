report 50111 "Beginend Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Beginendreport.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(No_; "No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }


            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Date; "Document Date")
            {

            }

            dataitem("Company Information"; "Company Information")
            {

                column(Name; Name)
                {

                }
                column(Picture; Picture)
                {

                }
                column(Address; Address)
                {

                }

            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Quantity; Quantity)
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Descrip; Description)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Document No." = field("No."), "Customer No." = field("Sell-to Customer No.");
                column(Description; Description)
                {

                }
                column(Amount; Amount)
                {

                }
                column(Remaining_Amount; "Remaining Amount")
                {

                }
            }
            dataitem(BeginningText; "Sales Invoice Text Code")
            {
                DataItemTableView = WHERE(Selection = CONST(beginend_enum::BeginningText), "Document Type" = const("Posted Invoice"));
                DataItemLink = "No." = field("No.");
                column(Begin_Text; "Text") { }
                column(BeginLineNo; lineNO) { }
            }
            dataitem(EndingText; "Sales Invoice Text Code")
            {
                DataItemTableView = WHERE(Selection = CONST(beginend_enum::EndingText), "Document Type" = const("Posted Invoice"));
                DataItemLink = "No." = field("No.");
                column(End_Text; Text) { }
                column(EndingLineNo; lineNO) { }
            }
        }
    }
}