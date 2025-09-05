table 50118 "Employee Asset table"
{
    Caption = 'Employee Asset table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
            TableRelation = "Employee info Table"."Employee ID";
        }

        field(2; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Employee info Table"."Employee Name" where("Employee ID" = field("Employee ID")));
        }

        field(3; "Asset ID"; Integer)
        {
            Caption = 'Asset ID';
            TableRelation = "Asset Table"."No";

            trigger OnValidate()
            begin
                GetAssetDetails("Asset ID");
            end;
        }

        field(4; "Serial No"; Code[20])
        {
            Caption = 'Serial No';
            Editable = false; // derived from Asset Table
        }

        field(6; Status; Enum "Employee Asset Status")
        {
            Caption = 'Status';

            trigger OnValidate()
            begin
                case Status of
                    Status::Assigned:
                        begin
                            "Assigned Date" := Today; // auto-fill only for Assigned
                            "Returned Date" := 0D;
                            "Lost Date" := 0D;
                        end;
                    Status::Returned:
                        begin
                            // user must enter manually
                            "Lost Date" := 0D;
                        end;
                    Status::Lost:
                        begin
                            // user must enter manually
                            "Returned Date" := 0D;
                        end;
                end;
            end;
        }

        field(7; "Assigned Date"; Date)
        {
            Caption = 'Assigned Date';
        }

        field(8; "Returned Date"; Date)
        {
            Caption = 'Returned Date';
        }

        field(9; "Lost Date"; Date)
        {
            Caption = 'Lost Date';
        }

    }

    keys
    {
        key(PK; "Employee ID", "Asset ID")
        {
            Clustered = true;
        }
    }

    local procedure GetAssetDetails(AssetID: Integer)
    var
        AssetRec: Record "Asset Table";
    begin
        if AssetRec.Get(AssetID) then
            "Serial No" := AssetRec."Serial No"
        else
            Clear("Serial No");
    end;
}


enum 50128 "Employee Asset Status"
{
    Extensible = true;

    value(1; Assigned)
    {
        Caption = 'Assigned';
    }
    value(2; Returned)
    {
        Caption = 'Returned';
    }
    value(3; Lost)
    {
        Caption = 'Lost';
    }
}
