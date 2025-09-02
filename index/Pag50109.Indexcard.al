namespace Training.Training;

page 50109 "Index card"
{
    ApplicationArea = All;
    Caption = 'Index card';
    PageType = Card;
    SourceTable = "Index Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("percent increase"; Rec."Percent increase")
                {
                    ApplicationArea = All;
                }
                field("End year"; Rec."End year")
                {
                    ApplicationArea = All;
                }
                field("Start year"; Rec."Start year")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
