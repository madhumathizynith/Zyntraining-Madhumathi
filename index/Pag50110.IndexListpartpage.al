namespace Training.Training;

page 50110 "Index Listpart page"
{
    ApplicationArea = All;
    Caption = 'Index Listpart page';
    PageType = ListPart;
    SourceTable = "Index value Entry";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Value"; Rec.Value)
                {
                    ApplicationArea = All;
                    Editable = False;
                }
                field("year"; Rec.year)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
