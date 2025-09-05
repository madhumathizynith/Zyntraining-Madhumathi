namespace Training.Training;

page 50140 "Asset Type List"
{
    ApplicationArea = All;
    Caption = 'Asset Type List';
    PageType = List;
    SourceTable = "Asset Type";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Asset List Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
