namespace Training.Training;

page 50133 "Assigned Asset Fact"
{
    ApplicationArea = All;
    Caption = 'Assigned Asset Fact';
    PageType = ListPart;
    SourceTable = "Employee Asset table";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }

                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnOpenPage()

    begin
        Rec.SetRange(Status, Rec.Status::Assigned)
    end;
}




