codeunit 50199 "Subscription Reminder Handler"
{
    procedure SendSubscriptionReminders()
    var
        Subscription: Record "Customer Subscription";
        Customer: Record Customer;
        ReminderDate: Date;
        Notification: Notification;
    begin
        ReminderDate := WorkDate + 15; // Reminder window: 15 days ahead

        Subscription.Reset();
        Subscription.SetRange("Next Renewal Date", ReminderDate);
        Subscription.SetRange("Remainder Sent", false);

        if Subscription.FindSet() then
            repeat
                // Get related customer
                if Customer.Get(Subscription."Customer ID") then begin
                    Notification.Message :=
                        StrSubstNo(
                            'Subscription %1 for customer %2 will expire on %3. Please renew.',
                            Subscription."Subscription ID",
                            Customer.Name,
                            Format(Subscription."Next Renewal Date"));

                    Notification.Send();
                end;

                // Mark as reminded
                Subscription."Remainder Sent" := true;
                Subscription.Modify(true);
            until Subscription.Next() = 0;
    end;
}

pageextension 50134 RoleCenterExtension extends "O365 Activities"
{
    actions
    {
        addlast(Processing)
        {
            action("Check Subscription Reminders")
            {
                ApplicationArea = All;
                Caption = 'Check Subscription Reminders';


                trigger OnAction()
                var
                    ReminderHandler: Codeunit "Subscription Reminder Handler";
                begin
                    ReminderHandler.SendSubscriptionReminders();
                end;
            }
        }
    }
}