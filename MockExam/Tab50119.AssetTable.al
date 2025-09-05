table 50119 "Asset Table"
{
    Caption = 'Asset Table';

    fields
    {
        field(1; "No"; Integer)
        {
            Caption = 'No';
            DataClassification = CustomerContent;
            AutoIncrement = true; // Asset ID
        }

        field(2; "Asset Type No"; Integer)
        {
            Caption = 'Asset Type No';
            DataClassification = CustomerContent;
            TableRelation = "Asset Type".No; // Link to Asset Type
        }

        field(3; "Asset Type"; Text[50])
        {
            Caption = 'Asset Type'; // 👈 make caption match field name
            FieldClass = FlowField;
            CalcFormula = lookup("Asset Type".Name where(No = field("Asset Type No")));
        }

        field(4; "Serial No"; Code[20])
        {
            Caption = 'Serial No';
            DataClassification = CustomerContent;
        }

        field(5; "Procured Date"; Date)
        {
            Caption = 'Procured Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ExpireDate: Date;
            begin
                ExpireDate := CalcDate('<+5Y>', "Procured Date");
                if Today > ExpireDate then
                    Available := false
                else
                    Available := true;
            end;
        }

        field(6; Vendor; Text[50])
        {
            Caption = 'Vendor';
            DataClassification = CustomerContent;
        }

        field(7; Available; Boolean)
        {
            Caption = 'Available';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }

        key(SerialKey; "Serial No")
        {
            Unique = true;
        }
    }
}
