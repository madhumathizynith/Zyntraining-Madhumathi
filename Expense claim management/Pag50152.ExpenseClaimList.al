namespace Training.Training;

page 50152 "Expense Claim List"
{
    ApplicationArea = All;
    Caption = 'Expense Claim List';
    PageType = List;
    SourceTable = "Expense Claim Table";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Expense Claim Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = All;
                }
                field(Subtype; Rec.Subtype)
                {
                    ApplicationArea = All;
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Bill; Rec.Bill)
                {
                    ApplicationArea = All;
                }
                field("Bill Date"; Rec."Bill Date")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Available amount"; Rec."Available amount")
                {
                    ApplicationArea = All;
                    Editable = False;
                    trigger OnValidate()

                    var
                        ClaimCU: Codeunit "Expense codeunit";
                    begin
                        ClaimCU.CalcAvailableAmount(Rec);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Status Cancellation")
            {


                Caption = 'Cancel';
                Image = Cancel;
                Enabled = (Rec.Status = Rec.Status::Pending);
                ApplicationArea = All;

                trigger OnAction()
                var
                    Claim: Record "Expense Claim Table";
                begin
                    if not Claim.Get(Rec.ID) then
                        Error('Claim %1 not found.', Rec.ID);

                    if not Confirm('Cancel claim %1?', true, Claim.ID) then
                        exit;

                    // Use Cancelled or Rejected depending on your enum
                    Claim.Status := Claim.Status::Cancelled;
                    Claim.Remarks := StrSubstNo('Cancelled by %1 on %2', Claim."Employee ID", WORKDATE);
                    Claim.Modify(true);

                    CurrPage.UPDATE(false);
                    Message('Claim %1 cancelled.', Claim.ID);
                end;
            }
        }
    }
}


