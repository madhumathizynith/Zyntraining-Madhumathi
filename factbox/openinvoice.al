page 50147 "Open Invoices"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Sales Invoice Header";
    SourceTableView = WHERE("Remaining Amount" = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Sales Invoice"; // Opens invoice card
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
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
            action("View All Open Invoices")
            {
                ApplicationArea = All;
                Caption = 'View All Open Invoices';
                Image = List;
                trigger OnAction()
                var
                    OpenInvRec: Record "Sales Invoice Header";
                begin
                    OpenInvRec.Copy(Rec);
                    PAGE.Run(PAGE::"Sales Invoice List", OpenInvRec);
                end;
            }
        }
    }
}
