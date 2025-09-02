page 50106 "Contact Business FactBox"
{
    PageType = ListPart;
    SourceTable = "Contact Business Relation";
    ApplicationArea = All;
    Caption = 'Contact Business';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contact No"; Rec."Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
