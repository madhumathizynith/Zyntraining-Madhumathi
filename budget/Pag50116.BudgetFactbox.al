page 50176 "Budget Factbox"
{
    PageType = ListPart;
    SourceTable = "Budget Table";

    Caption = 'Budget by Category';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Category"; Rec."Expense Category")
                {
                    ApplicationArea = All;
                    Caption = 'Category';
                }
                field("Remaining Budget"; RemainingBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Budget';
                }
            }
        }
    }

    var
        RemainingBudget: Decimal;

    trigger OnAfterGetRecord()
    var
        Expense: Record "Expense Table";
        Spent: Decimal;
    begin
        Expense.Reset();
        Expense.SetRange(Category, Rec."Expense Category");
        Expense.CalcSums(Amount);
        Spent := Expense.Amount;

        RemainingBudget := Rec."Budget Amount" - Spent;
    end;
}
