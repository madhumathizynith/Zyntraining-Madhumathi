page 50129 "Customer Sales Cue FactBox"
{
    PageType = CardPart;
    SourceTable = Customer;
    ApplicationArea = All;
    Caption = 'Customer Facts';

    layout
    {
        area(content)
        {
            cuegroup("Customer Status")
            {
                field("Open Invoice Count"; Rec."Open Invoice Count")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";

                    trigger OnDrillDown()
                    var
                        SalesInvHeader: Record "Sales Invoice Header";
                    begin
                        Rec.CalcFields("Open Invoice Count");
                        SalesInvHeader.SetRange("Sell-to Customer No.", Rec."No.");
                        SalesInvHeader.SetFilter("Remaining Amount", '>0');
                        PAGE.Run(PAGE::"Sales Invoice List", SalesInvHeader);
                    end;
                }

                field("Open Order Count"; Rec."Open Order Count")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";

                    trigger OnDrillDown()
                    var
                        SalesOrder: Record "Sales Header";
                    begin
                        Rec.CalcFields("Open Order Count");
                        SalesOrder.SetRange("Document Type", SalesOrder."Document Type"::Order);
                        SalesOrder.SetRange(Status, SalesOrder.Status::Open);
                        SalesOrder.SetRange("Sell-to Customer No.", Rec."No.");
                        PAGE.Run(PAGE::"Sales Order List", SalesOrder);
                    end;
                }
            }
        }
    }
}
