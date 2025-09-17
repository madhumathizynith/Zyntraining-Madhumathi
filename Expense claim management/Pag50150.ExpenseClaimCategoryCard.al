namespace Training.Training;

page 50150 "Expense Claim Category Card"
{
    ApplicationArea = All;
    Caption = 'Expense Claim Category Card';
    PageType = Card;
    SourceTable = "Expense Claim Category";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
