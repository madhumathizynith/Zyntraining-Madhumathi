tableextension 50146 ItemExt extends "Item"
{
    fields
    {
        field(50139; "currentinventory"; Decimal)
        {
            Caption = 'Current Inventory';
            FieldClass = FlowField;
            CalcFormula = sum("item ledger entry".Quantity where("Item No." = field("No.")));
        }
    }
}



pageextension 50146 ItemInventoryExt extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Current Inventry"; Rec.currentinventory)
            {
                ApplicationArea = All;
                Caption = 'Current Inventory';
                Editable = false;

            }
        }
    }

}