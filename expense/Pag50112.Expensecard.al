namespace Training.Training;

page 50112 "Expense card"
{
    ApplicationArea = All;
    Caption = 'Expense card';
    PageType = Card;
    SourceTable = "Expense Table";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Expense Id"; Rec."Expense Id")
                {
                    ApplicationArea = All;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()

                    begin
                        CurrPage.Update();
                        calcbudget();
                    end;
                }
                field("Remaining Budget"; RemainingBudget)
                {
                    Editable = False;
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        RemainingBudget: Decimal;

    trigger OnAfterGetRecord()

    begin
        calcbudget();
    end;

    local procedure calcbudget()
    var
        Exprec: Record "Expense Table";
        Budrec: Record "Budget Table";
        BudgetAmount: Decimal;
        ExpenseAmount: Decimal;

    begin
        RemainingBudget := 0;
        if Rec.Category = '' then
            exit;
        if Budrec.Get(Rec.Category) then
            BudgetAmount := Budrec."Budget Amount";
        Exprec.Reset();
        Exprec.SetRange(Category, Rec.Category);
        if Exprec.Findset() then
            repeat
                ExpenseAmount += Exprec.Amount;
            until Exprec.Next() = 0;
        RemainingBudget := BudgetAmount - ExpenseAmount;


    end;
}
