namespace Training.Training;

page 50114 "Budget List"
{
    ApplicationArea = All;
    Caption = 'Budget List';
    PageType = List;
    SourceTable = "Budget Table";
    UsageCategory = Lists;
    CardPageId = "Budget card";
    Editable = False;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = All;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;
                }
                field("Expense Category"; Rec."Expense Category")
                {

                    ApplicationArea = All;


                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}
