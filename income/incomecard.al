
page 50127 "Income card"
{
    ApplicationArea = All;
    Caption = 'Income card';
    PageType = Card;
    SourceTable = "Income Table";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Expense Id"; Rec."Income Id")
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
                }
            }
        }
    }
}


