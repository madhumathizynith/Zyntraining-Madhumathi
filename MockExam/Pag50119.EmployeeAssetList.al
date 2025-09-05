namespace Training.Training;

page 50119 "Employee Asset List"
{
    ApplicationArea = All;
    Caption = 'Employee Asset List';
    PageType = List;
    SourceTable = "Employee Asset table";
    UsageCategory = Lists;
    CardPageId = "Employee Asset Card";

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
                field("Asset ID"; Rec."Asset ID")
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
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = All;
                }
                field("Returned Date"; Rec."Returned Date")
                {
                    ApplicationArea = All;
                }
                field("Lost Date"; Rec."Lost Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
