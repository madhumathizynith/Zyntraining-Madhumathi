pageextension 50147 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(CustomerFacts; "Customer Sales Cue FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
