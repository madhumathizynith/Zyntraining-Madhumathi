page 50107 "Expense List"
{
    ApplicationArea = All;
    Caption = 'Expense List';
    PageType = List;
    SourceTable = "Expense Table";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Expense card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Expense Id"; Rec."Expense Id") { ApplicationArea = All; }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Category Page";
                }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field("Date"; Rec."Date") { ApplicationArea = All; }
            }
        }
        area(FactBoxes)
        {
            part("Budget Factbox"; "Budget Factbox")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Categories)
            {
                RunObject = page "Category Page";
            }

            action("Expected Expenses")
            {
                trigger OnAction()
                var
                    Exprep: Report "Expense Report";
                begin
                    // Pass selected category
                    Exprep.SetCategoryFilter(Rec.Category);
                    // Optional: set date filter, 0D = no filter
                    Exprep.SetDateFilter(0D, 0D);

                    // Run the report (Excel layout will be used)
                    Exprep.Run();
                end;
            }
        }

    }
}