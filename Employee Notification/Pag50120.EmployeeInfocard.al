namespace Training.Training;

page 50120 "Employee Info card"
{
    ApplicationArea = All;
    Caption = 'Employee Info card';
    PageType = Card;
    SourceTable = "Employee info table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
