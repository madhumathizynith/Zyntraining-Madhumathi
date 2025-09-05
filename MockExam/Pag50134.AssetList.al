namespace Training.Training;

page 50134 "Asset List"
{
    ApplicationArea = All;
    Caption = 'Asset List';
    PageType = List;
    SourceTable = "Asset Table";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Asset Card";

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
