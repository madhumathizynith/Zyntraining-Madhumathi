pageextension 50102 Technician extends "Business Manager Role Center"
{
    actions
    {
        addafter(Customers)
        {
            action("Technicians")
            {
                Caption = 'Technicians';
                ApplicationArea = All;
                Image = Employee;
                RunObject = Page "Technicians detail";
            } //
        }
    } // 
}