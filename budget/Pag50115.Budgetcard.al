namespace Training.Training;

page 50115 "Budget card"
{
    ApplicationArea = All;
    Caption = 'Budget card';
    PageType = Card;
    SourceTable = "Budget Table";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                    TableRelation = Category.Name;
                    DrillDownPageId = "Category Page";
                    DrillDown = true;
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StartDate: Date;
        EndDate: Date;
    begin
        // First day of current month
        StartDate := DMY2DATE(1, DATE2DMY(Today, 2), DATE2DMY(Today, 3));
        // Last day of current month
        EndDate := CALCDATE('<CM>', Today);

        Rec."From Date" := StartDate;
        Rec."To Date" := EndDate;
    end;

}
