tableextension 50100 PurchaseOrderExt extends "Purchase Header"
{
    fields
    {
        field(50101; "Purchase Approval Status"; Enum "Purchase Header Status")
        {
            Caption = 'Purchase Approval Status';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50121 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Purchase Approval Status"; Rec."Purchase Approval Status")
            {
                ApplicationArea = All;
                Caption = 'Purchase Approval Status';
                Style = Strong;
            }
        }
    }
}