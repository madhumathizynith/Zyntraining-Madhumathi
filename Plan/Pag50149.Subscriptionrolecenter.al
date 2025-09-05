pageextension 50166 Subscription extends "My Simple Role Center"

{
    layout
    {
        addlast(rolecenter)
        {
            part(ActiveSubscription; "Active Page")
            {
                ApplicationArea = All;
            }
            part("Revenue Generated"; "Revenue Cuepage")
            {
                ApplicationArea = All;


            }
        }
    }
}