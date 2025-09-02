namespace Training.Training;

page 50102 "Technician List page"
{
    ApplicationArea = All;
    Caption = 'Technician List page';
    PageType = List;
    SourceTable = Technician;
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
                field("No of problems"; Rec."No of problems")

                {
                    ApplicationArea = All;
                    Editable = False;
                }


            }
            part(Problems; Subpage)
            {
                SubPageLink = Technicians = FIELD(ID);
                ApplicationArea = All;
            }
        }
    }
}


