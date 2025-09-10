codeunit 50198 "Remainder Jobqueue"
{
    trigger OnRun()
    var
        Alert: Codeunit "Subscription Reminder Handler";

    begin

        Alert.SendSubscriptionReminders();

    end;


}