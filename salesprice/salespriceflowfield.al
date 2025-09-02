tableextension 50106 "Last Sold Item in SalesOrder" extends "Sales Header"
{

    fields
    {
        field(50118; "Last Posting Date"; Date)
        {

            Caption = 'Last Sold Price';
            FieldClass = FlowField;
            CalcFormula = max("Sales Price Table"."Posting Date" where("Customer No" = field("Sell-to Customer No."), "Item No" = field("No."), "Sell-to Customer Name" = field("Sell-to Customer Name")));
        }
        field(50111; "Last Sold Price"; Decimal)
        {

            Caption = 'Last Sold Price';
            FieldClass = FlowField;
            CaptionClass = 'Last Sold Price';
            CalcFormula = max("Sales Price Table"."LastItem Sold Price" where("Customer No" = field("Sell-to Customer No."), "Posting Date" = field("Posting Date"), "Sell-to Customer Name" = field("Sell-to Customer Name")));

        }
    }
}