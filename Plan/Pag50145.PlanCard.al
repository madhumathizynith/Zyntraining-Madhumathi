namespace Training.Training;

page 50145 "Plan Card"
{
    ApplicationArea = All;
    Caption = 'Plan Card';
    PageType = Card;
    SourceTable = "Plan Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';


                field("Plan ID"; Rec."Plan ID")
                {
                    ToolTip = 'Specifies the value of the Plan ID field.', Comment = '%';
                }
                field("Plan Name"; Rec."Plan Name")
                {
                    ToolTip = 'Specifies the value of the Plan Name field.', Comment = '%';
                }
                field("Plan Status"; Rec."Plan Status")
                {
                    ToolTip = 'Specifies the value of the Plan Status field.', Comment = '%';
                }
                field("Monthly Fee"; Rec."Monthly Fee")
                {
                    ToolTip = 'Specifies the value of the Monthly Fee field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }

            }
        }
    }
}
