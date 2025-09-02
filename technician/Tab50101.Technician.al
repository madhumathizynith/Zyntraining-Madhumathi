table 50101 Technician
{
    Caption = 'Technician';
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[20])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Phone No"; Code[10])
        {
            Caption = 'Phone No';
            DataClassification = CustomerContent;
        }
        field(4; Department; Enum Department)
        {
            Caption = 'Department';
        }
        field(5; "No of problems"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("problem table" where(Technicians = field(ID)));
        }
    }


    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}


enum 50102 Department
{
    Extensible = true;

    value(0; IT)
    {
        Caption = 'IT';
    }
    value(1; Hardware)
    {
        Caption = 'Hardware';
    }
    value(2; Network)
    {
        Caption = 'Network';
    }
}

