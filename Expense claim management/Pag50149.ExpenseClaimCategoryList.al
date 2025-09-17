namespace Training.Training;

page 50149 "Expense Claim Category List"
{
    ApplicationArea = All;
    Caption = 'Expense Claim Category List';
    PageType = List;
    SourceTable = "Expense Claim Category";
    UsageCategory = Lists;
    CardPageId = "Expense Claim Category Card";
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code "; Rec."Code ")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Subtype; Rec.Subtype)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Amount Limit"; Rec."Amount Limit")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
