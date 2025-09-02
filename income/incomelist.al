page 50126 "Income List"
{
    ApplicationArea = All;
    Caption = 'Income List';
    PageType = List;
    SourceTable = "Income Table";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Income card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Income Id"; Rec."Income Id") { ApplicationArea = All; }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Income Category page";
                }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field("Date"; Rec."Date") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Categories)
            {
                RunObject = page "Income Category page";
            }

            action("Expected Income")
            {
                trigger OnAction()
                var
                    Increp: Report "Income Report";
                begin
                    // Pass selected category
                    Increp.SetCategoryFilter(Rec.Category);
                    // Optional: set date filter, 0D = no filter
                    Increp.SetDateFilter(0D, 0D);

                    // Run the report (Excel layout will be used)
                    Increp.Run();
                end;
            }
        }
    }
}
