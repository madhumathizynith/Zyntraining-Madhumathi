namespace Training.Training;

page 50142 "Asset List Card"
{
    ApplicationArea = All;
    Caption = 'Asset List Card';
    PageType = Card;
    SourceTable = "Asset Type";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
