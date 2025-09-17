table 50125 "Expense Claim Table"
{
    Caption = 'Expense Claim Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }
        field(2; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
            TableRelation = "Employee info Table"."Employee ID";
        }

        // Stored relation to Category (use the PK of the category table - here I assume "Code")
        field(11; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            TableRelation = "Expense Claim Category"."Code ";
        }

        // FlowFields for display only (look up via Category Code)
        field(3; "Category Name"; Text[100])
        {
            Caption = 'Category Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Expense Claim Category".Name WHERE("Code " = FIELD("Category Code")));
        }
        field(4; Subtype; Text[100])
        {
            Caption = 'Subtype';
            FieldClass = FlowField;
            CalcFormula = Lookup("Expense Claim Category".Subtype WHERE("Code " = FIELD("Category Code")));
        }

        field(5; "Claim Date"; Date)
        {
            Caption = 'Claim Date';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                ValidateClaimAmount();
            end;
        }
        field(7; Status; Enum "Expense Claim Status")
        {
            Caption = 'Status';
        }
        field(8; Bill; Blob)
        {
            Caption = 'Bill';
            Subtype = UserDefined;
        }
        field(9; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(10; "Bill Date"; Date)
        {
            Caption = 'Bill Date';
        }
        field(12; "Available amount"; Decimal)
        {
            Caption = 'Available Amount';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    procedure ValidateClaimAmount()
    var
        CategoryRec: Record "Expense Claim Category";
    begin
        // Ensure we have a category code selected
        if "Category Code" = '' then
            Error('Please select a Category.');

        // Use Get with the actual PK (here Code). If your PK differs, use SetRange/FindFirst.
        if CategoryRec.Get("Category Code") then begin
            // If you want to block invalid amounts:
            if Amount > CategoryRec."Amount Limit" then
                Error('Amount %1 exceeds allowed limit %2 for category %3', Amount, CategoryRec."Amount Limit", CategoryRec.Name);

            // If you instead want to auto-set status (without throwing), do:
            // Status := Status::Approved; // or Rejected based on logic
        end else
            Error('Category %1 not found.', "Category Code");
    end;
}
