page 50122 "Visit Log List"
{
    PageType = List;
    SourceTable = "Visit Log";
    ApplicationArea = All;
    UsageCategory = Lists;
    InsertAllowed = false;
    Editable = false;
    CardPageId = "Visit Log Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.") { }
                field("Visit Date"; Rec."Visit Date") { }
                field("Purpose"; Rec.Purpose) { }
                field("Notes"; Rec.Notes) { }
            }
        }
    }
    var
        FilterCustomerNo: Code[20];

    procedure SetCustomerNo(CustomerNo: Code[20])
    begin
        FilterCustomerNo := CustomerNo;
        Rec.SetRange("Customer No.", CustomerNo); // ✅ Proper way to filter the dataset
    end;

}

