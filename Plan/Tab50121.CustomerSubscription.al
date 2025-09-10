table 50121 "Customer Subscription"
{
    Caption = 'Customer Subscription';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Subscription ID"; Integer)
        {
            Caption = 'Subscription ID';
            AutoIncrement = true;

        }
        field(2; "Customer ID"; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = Customer."No.";

        }
        field(3; "Plan ID"; Code[20])
        {
            Caption = 'Plan ID';
            TableRelation = "Plan Table"."Plan ID";
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()

            begin
                if "Start Date" <> 0D then begin
                    "Next Bill date" := CalcDate('+1M', "Start Date");
                    "End Date" := CalcDate('+1Y', "Start Date") - 1;
                    "Next Renewal Date" := "End Date" + 1;
                end else if "Start Date" = 0D then begin
                    Message('Please enter the start date');
                end;

            end;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            Editable = false;
        }
        field(6; "Next Bill date"; Date)
        {
            Caption = 'Next Bill date';
            Editable = false;
        }
        field(7; "Subscription Status"; Enum "Subscription Status")
        {
            Caption = 'Subscription Status';
        }
        field(8; "Next Renewal Date"; Date)
        {
            Caption = 'Next Renewal Date';


        }
        field(9; "Remainder Sent"; Boolean)
        {
            Caption = 'Remainder Sent';

        }



    }



    keys
    {
        key(PK; "Subscription ID")
        {
            Clustered = true;
        }

    }
    trigger OnModify()
    begin
        WorkDate := Today;
        if ("End Date" <> 0D) and ("End Date" < WorkDate) then
            "Subscription Status" := "Subscription Status"::Expired;
    end;

    local procedure GetID()
    var
        Plan: Record "Plan Table";
    begin
        if Plan.Get("Plan ID") then
            "Plan ID" := Plan."Plan ID"
        else
            Clear("Plan ID");
    end;

}


enum 50197 "Subscription Status"
{
    Extensible = true;

    value(0; Active)
    {
        Caption = 'Active';
    }
    value(1; InActive)
    {
        Caption = 'InActive';
    }
    value(2; Expired)
    {
        Caption = 'Expired';
    }
}