namespace Training.Training;

page 50118 "Resume Expense Card"
{
    ApplicationArea = All;
    Caption = 'Resume Expense Card';
    PageType = Card;
    SourceTable = "Resuming Expenses";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field(Cycle; Rec.Cycle)
                {
                    ApplicationArea = All;
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = All;
                }
                field("Next Cycle Date"; Rec."Next Cycle Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
