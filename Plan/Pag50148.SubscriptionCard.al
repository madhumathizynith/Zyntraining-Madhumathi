namespace Training.Training;

page 50148 "Subscription Card"
{
    ApplicationArea = All;
    Caption = 'Subscription Card';
    PageType = Card;
    SourceTable = "Customer Subscription";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
            }
        }
    }
}
