namespace Training.Training;

page 50132 "Leave Request Card"
{
    ApplicationArea = All;
    Caption = 'Leave Request Card';
    PageType = Card;
    SourceTable = "Leave Request Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
    trigger OnAfterGetRecord()

    begin
        Rec.CalcRemainingLeave();

    end;
}


