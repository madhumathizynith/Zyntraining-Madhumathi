namespace Training.Training;

page 50144 "Plan List"
{
    ApplicationArea = All;
    Caption = 'Plan List';
    PageType = List;
    SourceTable = "Plan Table";
    UsageCategory = Lists;
    CardPageId = "Plan Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = All;
                }
                field("Plan Name"; Rec."Plan Name")
                {
                    ApplicationArea = All;
                }
                field("Plan Status"; Rec."Plan Status")
                {
                    ApplicationArea = All;
                }
                field("Monthly Fee"; Rec."Monthly Fee")
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
