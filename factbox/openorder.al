page 50138 "Open Orders"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = CONST(Order),
                            Status = CONST(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order";
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("View All Open Orders")
            {
                ApplicationArea = All;
                Caption = 'View All Open Orders';
                Image = List;
                trigger OnAction()
                var
                    OpenOrderRec: Record "Sales Header";
                begin
                    OpenOrderRec.Copy(Rec);
                    PAGE.Run(PAGE::"Sales Order List", OpenOrderRec);
                end;
            }
        }
    }
}
