page 50141 "Income Category page"
{
    ApplicationArea = All;
    Caption = 'Income Category Page';
    PageType = List;
    SourceTable = "Income Category";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

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
            part("Category Factbox"; "Income Factbox")
            {
                SubPageLink = Name = field(Name);
            }
        }
    }
}

