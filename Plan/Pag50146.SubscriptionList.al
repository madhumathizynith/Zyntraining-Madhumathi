namespace Training.Training;

page 50146 "Subscription List"
{
    ApplicationArea = All;
    Caption = 'Subscription List';
    PageType = List;
    SourceTable = "Customer Subscription";
    UsageCategory = Lists;
    Editable = False;
    CardPageId = "Subscription Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Subscription ID"; Rec."Subscription ID")
                {
                    ApplicationArea = All;
                }
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                }
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Next Bill date"; Rec."Next Bill date")
                {
                    ApplicationArea = All;
                }
                field("Subscription Status"; Rec."Subscription Status")
                {
                    ApplicationArea = All;
                }
                field("Remainder Sent"; Rec."Remainder Sent")
                {
                    ApplicationArea = All;
                }
                field("Next Renewal Date"; Rec."Next Renewal Date")
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Test Reminder")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Reminder: Codeunit "Subscription Reminder Handler";
                begin
                    Reminder.SendSubscriptionReminders();
                end;
            }
        }
    }

}
