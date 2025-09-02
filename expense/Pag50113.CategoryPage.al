namespace Training.Training;

page 50113 "Category Page"
{
    ApplicationArea = All;
    Caption = 'Category Page';
    PageType = List;
    SourceTable = Category;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }


                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part("Category Factbox"; "Expense Factbox")
            {
                SubPageLink = Name = field(Name);
            }
            part("Budget Factbox"; "Budget Factbox")
            {
                SubPageLink = "Expense Category" = field(Name);
            }
            part("Budget Tile"; "Budget tile")
            {
                SubPageLink = Name = field(Name);


            }
        }

    }
}
