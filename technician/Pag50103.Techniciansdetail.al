namespace Training.Training;

page 50103 "Technicians detail"
{
    ApplicationArea = All;
    Caption = 'Technicians detail';
    PageType = List;
    SourceTable = Technician;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = All;
                }
            }


        }
    }
}
