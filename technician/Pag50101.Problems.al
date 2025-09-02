namespace Training.Training;

page 50101 Problems
{
    ApplicationArea = All;
    Caption = 'Problems';
    PageType = Card;
    SourceTable = "problem table";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Problem card';

                field("Problem ID"; Rec."Problem ID")
                {
                    ApplicationArea = All;
                }
                field(Problem; Rec.Problem)
                {
                    DrillDown = true;

                }
                field(Technicians; Rec.Technicians)
                {
                    DrillDown = true;
                }

                field(Department; Rec.Department)
                {
                    DrillDown = True;
                }

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = All;
                }

            }

        }
    }
}
