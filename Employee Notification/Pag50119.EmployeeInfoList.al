page 50189 "Employees info List"
{
    PageType = List;
    SourceTable = "Employee info Table";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Employee Info card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee ID"; Rec."Employee ID") { }
                field("Employee Name"; Rec."Employee Name") { }
                field(Department; Rec.Department) { }
                field(Role; Rec.Role) { }



            }
        }
    }


}
