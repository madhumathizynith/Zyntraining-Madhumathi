namespace Training.Training;

using Microsoft.Sales.Customer;

tableextension 50117 loyaltyext extends Customer
{
    fields
    {
        field(50100; Loyaltypoint; Integer)
        {
            Caption = 'Loyaltypoint';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50112 loyalpointext extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Loyaltypoint; Rec.Loyaltypoint)
            {
                ApplicationArea = All;
            }
        }
    }
}