pageextension 50123 CustomerCardFactBoxExt extends "Customer Card"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(ContactBusinessFactBox; "Contact Business FactBox")
            {
                ApplicationArea = All;
                // This links the FactBox to show only Contact Business records for the current customer
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
