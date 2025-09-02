namespace Training.Training;

page 50125 "Leave Category List"
{
    ApplicationArea = All;
    Caption = 'Leave Category List';
    PageType = List;
    SourceTable = "Leave Category";
    CardPageId = "Leave Category Card";
    Editable = False;
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
