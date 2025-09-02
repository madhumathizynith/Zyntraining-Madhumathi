namespace Training.Training;

page 50128 "Leave Category Card"
{
    ApplicationArea = All;
    Caption = 'Leave Category Card';
    PageType = Card;
    SourceTable = "Leave Category";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Leave Category"; Rec."Leave Category")
                {
                    ApplicationArea = All;
                }
                field("No. of days allowed"; Rec."No. of days allowed")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
