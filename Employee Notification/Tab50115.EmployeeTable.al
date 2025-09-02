table 50115 "Employee Leave Table"
{
    Caption = 'Employee Leave Table';

    fields
    {
        field(1; "Employee ID"; Code[10])
        {
            Caption = 'Employee ID';
            TableRelation = "Employee info Table"."Employee ID";
        }

        field(2; "Leave Category"; Enum "Leave Category")
        {
            Caption = 'Leave Category';
        }

        field(3; "Leave Taken"; Integer)
        {
            Caption = 'Leave Taken';
            TableRelation = "Leave Category"."Leave Category";
            trigger OnValidate()
            var
                leavereq: Record "Leave Request Table";
                leavecat: Record "Leave Category";
                UsedLeave: Integer;
                Totalleave: Integer;
            begin
                if leavecat.Get("Leave Category") then
                    Totalleave := leavecat."No. of days allowed" else
                    Totalleave := 0;


                UsedLeave := 0;
                leavereq.Reset();
                leavereq.SetRange("Employee ID", "Employee ID");
                leavereq.SetRange("Leave Category", "Leave Category");
                leavereq.SetRange("Leave Status", leavereq."Leave Status"::Approved);
                if
                leavecat.FindSet() then
                    repeat
                        UsedLeave := (leavereq."End Date" - leavereq."Start Date") + 1;
                    until
                    leavecat.Next() = 0;
                "Remaining Leave" := Totalleave - UsedLeave;

            end;


        }

        field(4; "Remaining Leave"; Integer)
        {
            Caption = 'Remaining Leave';
            Editable = false;

        }
    }

    keys
    {
        key(PK; "Employee ID", "Leave Category") { Clustered = true; }
    }







}