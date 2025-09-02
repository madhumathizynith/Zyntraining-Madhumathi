namespace Training.Training;

page 50121 "Index Page"
{
    ApplicationArea = All;
    Caption = 'Index Page';
    PageType = List;
    SourceTable = "Index Table";
    UsageCategory = Lists;
    CardPageId = "Index card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field("Percent increase"; Rec."Percent increase")
                {
                    Caption = 'Percentage Increase';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }


        }
    }
}
