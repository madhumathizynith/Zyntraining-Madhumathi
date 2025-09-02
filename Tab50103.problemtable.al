table 50103 "problem table"
{
    Caption = 'problem table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Problem ID"; Code[5])
        {
            Caption = 'Problem ID';
        }
        field(2; Problem; enum problem)
        {
            Caption = 'Problem';
        }
        field(3; Technicians; Code[10])
        {
            Caption = 'Technician ID';
            TableRelation = Technician.ID;
        }
        field(4; Department; Enum Department)
        {
            TableRelation = Technician.Department;
        }
        field(5; Descriptions; Text[100])
        {
            Caption = 'Descriptions';
        }
        field(6; "Date"; Date)
        {
            Caption = 'Date';
        }
    }
    keys
    {
        key(PK; "Problem ID")
        {
            Clustered = true;
        }
    }
}


enum 50104 problem
{
    Extensible = true;

    value(0; "Network issue")
    {
        caption = 'Network issue';
    }
    value(1; "Technical issue")
    {
        caption = 'Technical issue';
    }
    value(2; "Hardware issue")
    {
        caption = 'Hardware issue';
    }
    value(3; "other")
    {
        caption = 'other';
    }

}