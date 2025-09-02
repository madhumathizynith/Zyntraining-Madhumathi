namespace Training.Training;

page 50104 Subpage
{
    ApplicationArea = All;
    Caption = 'Subpage';
    PageType = ListPart;
    SourceTable = "problem table";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Problem ID"; Rec."Problem ID")
                {

                }
                field(Problem; Rec.Problem)
                {

                }
                field(Department; Rec.Department)
                {

                }
                field("Date"; Rec."Date")
                {

                }
                field(Descriptions; Rec.Descriptions)
                {

                }
                field(Technicians; Rec.Technicians)
                {

                }
            }
        }
    }
}
