page 50124 "Visit Log Entry"
{
    PageType = Card;
    SourceTable = "Visit Log";
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer No."; Rec."Customer No.") { }
                field("Visit Date"; Rec."Visit Date") { }
                field("Purpose"; Rec.Purpose) { }
                field("Notes"; Rec.Notes) { }
            }
        }
    }
}
