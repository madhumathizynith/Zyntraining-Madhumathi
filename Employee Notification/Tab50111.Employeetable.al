table 50111 "Employee info Table"
{
    Caption = 'Employee Table';

    fields
    {
        field(1; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
        }

        field(2; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }

        field(3; Department; Enum Dep)
        {
            Caption = 'Department';
        }

        field(4; Role; Text[30])
        {
            Caption = 'Role';
        }




    }

    keys
    {
        key(PK; "Employee ID") { Clustered = true; }
    }


}


enum 50183 Dep
{
    Extensible = true;

    value(1; HR)
    {
        Caption = 'HR';
    }
    value(2; Finance)
    {
        Caption = 'Finance';
    }
    value(3; Marketing)
    {
        Caption = 'Marketing';
    }
    value(4; IT)
    {
        Caption = 'IT';
    }
    value(5; Purchase)
    {
        Caption = 'Purchase';
    }

}