pageextension 50108 CustomerCardExt extends "Customer Card"
{
    actions
    {
        addlast(processing)
        {
            action(VisitLog)
            {
                ApplicationArea = All;
                Caption = 'Visit Log';
                Image = Apply; // Optional - you can choose an icon
                trigger OnAction()
                var
                    "LogListPage": Page "Visit Log List";
                begin
                    LogListPage.SetCustomerNo(Rec."No.");
                    LogListPage.RunModal();
                end;
            }

        }
    }

}
