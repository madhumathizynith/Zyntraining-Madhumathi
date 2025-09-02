pageextension 50103 podtedcreditmemopageext extends "Posted Sales Credit Memo"
{
    layout
    {
        addlast(content)
        {
            field("Beginning Posted Memo"; Rec."Beginning Posted Memo")
            {
                Caption = 'Beginning Text';
                ApplicationArea = all;
                TableRelation = "Standard text".Code;
                Editable = false;
            }
            part("Beginning Line Memo"; "Beginning Text Codes")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("No."), "Document Type" = const("Posted Credit Memo"), Selection = const(BeginningText);
            }
            field("Ending Posted Memo"; Rec."Ending Posted Memo")
            {
                Caption = 'Ending Text';
                ApplicationArea = all;
                TableRelation = "Standard text".Code;
                Editable = false;
            }
            part("Ending Line Memo"; "Ending Text Codes")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("No."), "Document Type" = const("Posted Credit Memo"), Selection = const(EndingText);
            }
        }
    }
}
