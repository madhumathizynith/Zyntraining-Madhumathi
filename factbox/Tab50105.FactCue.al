tableextension 50105 "Customer Fact Cues Ext" extends Customer
{
    fields
    {
        field(50110; "Open Invoice Count"; Integer)
        {
            Caption = 'Open Invoices';
            FieldClass = FlowField;
            CalcFormula = Count("Sales Invoice Header" WHERE(
                "Sell-to Customer No." = FIELD("No."),
                "Remaining Amount" = FILTER(> 0)
            ));
        }

        field(50101; "Open Order Count"; Integer)
        {
            Caption = 'Open Orders';
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" WHERE(
                "Sell-to Customer No." = FIELD("No."),
                "Document Type" = CONST(Order),
                Status = CONST(Open)
            ));
        }
    }
}
