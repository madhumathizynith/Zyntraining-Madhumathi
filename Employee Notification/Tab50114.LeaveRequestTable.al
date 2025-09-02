table 50114 "Leave Request Table"
{
    Caption = 'Leave Request Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Request ID"; Integer)
        {
            Caption = 'Request ID';
            AutoIncrement = true;
        }
        field(2; "Employee ID"; code[10])
        {
            Caption = 'Employee ID';
            TableRelation = "Employee info table"."Employee ID";
        }
        field(3; "Leave Category"; Enum "Leave Category")
        {
            Caption = 'Leave Category';

        }
        field(4; Reason; Text[50])
        {
            Caption = 'Reason';
        }
        field(5; "No of days"; Integer)
        {
            Caption = 'No of leave';
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()

            begin
                if "Start Date" = 0D then
                    Error('Please enter the start date');
                if ("End Date" <> 0D) and ("Start Date" > "End Date") then
                    Error(('Enter valid date'));
            end;

        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
            trigger OnValidate()
            begin
                if "End Date" = 0D then
                    Error('Please enter the end date');

                if ("Start Date" <> 0D) and ("End Date" < "Start Date") then
                    Error(('Enter valid date'));
            end;

        }
        field(8; "Leave Status"; Enum "Leave Status")
        {
            Caption = 'Leave Status';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Rec."Leave Status" = "Leave Status"::Approved then
                    CalcLeaveDays();

            end;


        }
        field(9; "Remaining leave"; Integer)
        {

        }

    }
    keys
    {
        key(PK; "Request ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
#pragma warning disable AL0603

#pragma warning restore AL0603
        "Leave Status" := "Leave Status"::Pending;  // force default to Pending
    end;

    trigger OnDelete()
    begin
        if "Leave Status" <> "Leave Status"::Pending then
            Error('You can only delete leave requests that are still Pending.');
    end;


    local procedure CalcLeaveDays()
    begin
        if (Rec."Start Date" <> 0D) and (Rec."End Date" <> 0D) then begin
            if Rec."End Date" >= Rec."Start Date" then
                Rec."No of days" := (Rec."End Date" - Rec."Start Date") + 1
            else
                Rec."No of days" := 0; // invalid range
        end;
    end;

    procedure CalcRemainingLeave()
    var
        LeaveCategory: Record "Leave Category";
        LeaveRequest: Record "Leave Request Table";
        Leave: Integer;
    begin
        // Lookup the master row for this leave category
        if LeaveCategory.Get("Leave Category") then begin
            Leave := 0;

            LeaveRequest.Reset();
            LeaveRequest.SetRange("Employee ID", "Employee ID");
            LeaveRequest.SetRange("Leave Category", "Leave Category");
            LeaveRequest.SetRange("Leave Status", LeaveRequest."Leave Status"::Approved);

            if LeaveRequest.FindSet() then
                repeat
                    // Use your chosen logic; here we keep date-span inclusive:
                    Leave += (LeaveRequest."End Date" - LeaveRequest."Start Date" + 1);
                // Alternatively: "Leave Taken" += LeaveRequest."No of days";
                until LeaveRequest.Next() = 0;

            "Remaining Leave" := LeaveCategory."No. of days allowed" - Leave;
        end else
            "Remaining Leave" := 0;
    end;






}


enum 50190 "Leave Status"
{
    Extensible = true;

    value(0; Approved)
    {
        Caption = 'Approved';
    }
    value(1; Pending)
    {
        Caption = 'Pending';
    }
    value(2; Rejected)
    {
        Caption = 'Rejected';
    }
}