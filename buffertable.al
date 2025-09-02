table 50113 "Buffer Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Field ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Field Name"; Text[100]) { }
        field(3; "Field Value"; Text[100]) { }
        field(4; "Record ID"; RecordId)

        { }
    }

    keys
    {
        key(PK; "Field ID", "Field Name") { Clustered = true; }
    }
}

page 50137 "Buffer Table List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Buffer Table";

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("Field ID"; Rec."Field ID")
                {
                    ApplicationArea = All;
                }
                field("Field Name"; Rec."Field Name")

                {
                    ApplicationArea = All;
                }



            }
        }
    }
}
pageextension 50136 upadteFieldext extends Companies
{
    actions
    {
        addlast(processing)
        {
            action(Updatefield)
            {
                ApplicationArea = All;
                Caption = 'Update Field';
                RunObject = page "UpdateField";
            }
        }
    }
}
