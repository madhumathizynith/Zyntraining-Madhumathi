namespace Training.Training;

page 50130 "Leave Request List"
{
    ApplicationArea = All;
    Caption = 'Leave Request List';
    PageType = List;
    SourceTable = "Leave Request Table";
    UsageCategory = Lists;
    CardPageId = "Leave request Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Request ID"; Rec."Request ID")
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Leave Category"; Rec."Leave Category")
                {
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }

                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = All;
                }
                field("Remaining Leave"; Rec."Remaining leave")
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
            action("Leave Approval")
            {
                trigger OnAction()
                begin
                    Rec."Leave Status" := Rec."Leave Status"::Approved;
                    Rec.Modify(true);           // fires OnModify -> UpdateEmployeeLeave()
                    CurrPage.Update(false);     // refresh UI
                end;
            }
            action(DeleteRequest)
            {
                ApplicationArea = All;
                Caption = 'Cancel Leave';
                Image = Delete;

                trigger OnAction()
                begin
                    if Rec."Leave Status" <> Rec."Leave Status"::Pending then
                        Error('Only pending leave status can be cancelled.');

                    Rec.Delete(true); // cascade + confirm
                    Message('Leave request %1 cancelled successfully.', Rec."Request ID");
                end;
            }

        }
    }
    trigger OnAfterGetRecord()

    begin
        Rec.CalcRemainingLeave();
    end;

}
