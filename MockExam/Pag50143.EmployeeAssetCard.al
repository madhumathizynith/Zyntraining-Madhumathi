page 50143 "Employee Asset Card"
{
    ApplicationArea = All;
    Caption = 'Employee Asset Card';
    PageType = Card;
    SourceTable = "Employee Asset table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee ID"; Rec."Employee ID") { ApplicationArea = All; }
                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }
                field("Asset ID"; Rec."Asset ID") { ApplicationArea = All; }
                field("Serial No"; Rec."Serial No") { ApplicationArea = All; }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetFieldEditability();
                        CurrPage.Update();
                    end;
                }

                // Always visible & editable
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = All;
                }

                field("Returned Date"; Rec."Returned Date")
                {
                    ApplicationArea = All;
                    Editable = CanEditReturnedDate;
                }

                field("Lost Date"; Rec."Lost Date")
                {
                    ApplicationArea = All;
                    Editable = CanEditLostDate;
                }
            }
        }
    }

    var
        CanEditReturnedDate: Boolean;
        CanEditLostDate: Boolean;

    trigger OnAfterGetRecord()
    begin
        SetFieldEditability();
    end;

    local procedure SetFieldEditability()
    begin
        case Rec.Status of
            Rec.Status::Assigned:
                begin
                    CanEditReturnedDate := false;
                    CanEditLostDate := false;
                end;
            Rec.Status::Returned:
                begin
                    CanEditReturnedDate := true;
                    CanEditLostDate := false;
                end;
            Rec.Status::Lost:
                begin
                    CanEditReturnedDate := false;
                    CanEditLostDate := true;
                end;
            else begin
                CanEditReturnedDate := false;
                CanEditLostDate := false;
            end;
        end;
    end;
}
