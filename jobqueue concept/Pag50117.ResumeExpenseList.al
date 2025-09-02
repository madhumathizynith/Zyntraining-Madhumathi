namespace Training.Training;

page 50117 "Resume Expense List"
{
    ApplicationArea = All;
    Caption = 'Resume Expense List';
    PageType = List;
    SourceTable = "Resuming Expenses";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Resume Expense Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
