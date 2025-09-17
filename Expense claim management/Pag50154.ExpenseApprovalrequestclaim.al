namespace Training.Training;

page 50154 "Expense Approval request claim"
{
    ApplicationArea = All;
    Caption = 'Expense Approval request claim';
    PageType = List;
    SourceTable = "Expense Claim Table";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID) { ApplicationArea = All; }
                field("Employee ID"; Rec."Employee ID") { ApplicationArea = All; }
                field("Category Name"; Rec."Category Name") { ApplicationArea = All; }
                field(Subtype; Rec.Subtype) { ApplicationArea = All; }
                field("Claim Date"; Rec."Claim Date") { ApplicationArea = All; }
                field(Bill; Rec.Bill) { ApplicationArea = All; }
                field("Bill Date"; Rec."Bill Date") { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field(Remarks; Rec.Remarks) { ApplicationArea = All; }
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
            action(ApprovalStatus)
            {
                ApplicationArea = All;
                Caption = 'Approve/Reject';
                trigger OnAction()
                var
                    Approved: Boolean;
                    ClaimCU: Codeunit "Expense codeunit";
                begin
                    Approved := ApprovalProcedure();
                    ClaimCU.CalcAvailableAmount(Rec);
                    if Approved then
                        Message('Claim %1 approved.', Rec.ID)
                    else
                        Message('Claim %1 rejected.', Rec.ID);
                end;

            }

        }

    }

    procedure ApprovalProcedure(): Boolean
    var
        ClaimRec: Record "Expense Claim Table";
        CategoryRec: Record "Expense Claim Category";
        Reason: Text[100];
    begin
        if Rec.Status <> Rec.Status::Pending then
            exit(false); // only process pending claims

        if not ClaimRec.Get(Rec.ID) then
            exit(false);

        // 1. Validate Category & Amount
        if CategoryRec.Get(Rec."Category Code") then begin
            if ClaimRec.Amount > CategoryRec."Amount Limit" then begin
                ClaimRec.Status := ClaimRec.Status::Rejected;
                Reason := StrSubstNo(
                    'Amount %1 exceeds allowed limit %2 for category %3',
                    ClaimRec.Amount, CategoryRec."Amount Limit", CategoryRec.Name);
                ClaimRec.Remarks := Reason;
                ClaimRec.Modify(true);
                exit(false);
            end;
        end;

        // 2. Validate Bill Date
        if ClaimRec."Bill Date" < CalcDate('-3M', ClaimRec."Claim Date") then begin
            ClaimRec.Status := ClaimRec.Status::Rejected;
            ClaimRec.Remarks := 'Bill date is older than 3 months from claim date';
            ClaimRec.Modify(true);
            exit(false);
        end;

        // 3. Duplicate check
        ClaimRec.Reset();
        ClaimRec.SetRange("Employee ID", Rec."Employee ID");
        ClaimRec.SetRange(Amount, Rec.Amount);
        ClaimRec.SetFilter(ID, '<>%1', Rec.ID);
        if ClaimRec.FindFirst() then begin
            Rec.Status := Rec.Status::Rejected;
            Rec.Remarks := 'Duplicate claim detected';
            Rec.Modify(true);
            exit(false);
        end;

        // If all validations passed
        Rec.Status := Rec.Status::Approved;
        Rec.Remarks := 'Approved';
        Rec.Modify(true);
        exit(true);
    end;
}
