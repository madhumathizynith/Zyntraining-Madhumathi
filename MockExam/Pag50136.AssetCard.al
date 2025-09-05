namespace Training.Training;

page 50136 "Asset Card"
{
    ApplicationArea = All;
    Caption = 'Asset Card';
    PageType = Card;
    SourceTable = "Asset Table";

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
                field("Asset Type No"; Rec."Asset Type No")
                {
                    ApplicationArea = All;
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = All;
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                }
                field("Procured Date"; Rec."Procured Date")
                {
                    ApplicationArea = All;
                }
                field(Vendor; Rec.Vendor)
                {
                    ApplicationArea = All;
                }
                field(Available; Rec.Available)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
