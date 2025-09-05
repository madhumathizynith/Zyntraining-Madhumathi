page 50184 "My Simple Role Center"
{
    PageType = RoleCenter;
    Caption = 'My Simple Role Center';
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            systempart(Notes; Notes) { ApplicationArea = All; }
            systempart(MyLinks; Links) { ApplicationArea = All; }
        }


    }
    actions
    {
        area(Sections)
        {
            group("Employee Asset")
            {
                action("Asset Type")
                {
                    Caption = 'Asset Type';
                    RunObject = page "Asset Type List";
                    ApplicationArea = All;
                }
                action("Employee Asset List")
                {
                    Caption = 'Employee Asset List';
                    RunObject = page "Employee Asset List";
                    ApplicationArea = All;
                }
                action("Asset")
                {
                    Caption = 'Asset List';
                    RunObject = page "Asset List";
                    ApplicationArea = All;
                }
            }
            group("Visit Log")
            {
                action("Visit log list")
                {
                    Caption = 'VIsit Log List';
                    RunObject = page "Visit Log List";
                    ApplicationArea = All;
                }
                action("Log Entry")
                {
                    Caption = 'Visit Log entry';
                    RunObject = page "Visit Log Entry";
                    ApplicationArea = All;
                }
            }

            group("Yearly Budget")
            {
                action(Category)
                {
                    RunObject = page "Category Page";
                    ApplicationArea = All;
                    Caption = 'Category';

                }
                action(Expense)
                {
                    RunObject = page "Expense List";
                    ApplicationArea = All;
                    Caption = 'Category';

                }
                action("Income Category")
                {
                    RunObject = page "Income Category page";
                    ApplicationArea = All;
                    Caption = 'Income Category';

                }
                action(Income)
                {
                    RunObject = page "Income List";
                    ApplicationArea = All;
                    Caption = 'Income List';

                }
                action(Budget)
                {
                    RunObject = page "Budget List";
                    ApplicationArea = All;
                    Caption = 'Budget List';

                }
            }
            group("Leave Request")
            {
                action("Employee Detail")
                {
                    Caption = 'Employee';
                    ApplicationArea = All;
                    RunObject = page "Employees info List";
                }
                action("Leave Category")
                {
                    Caption = 'Leave Category';
                    ApplicationArea = All;
                    RunObject = page "Leave Category List";
                }
                action("Leave Request ")
                {
                    Caption = 'Leave Request';
                    ApplicationArea = All;
                    RunObject = page "Leave Request List";
                }
            }
            group(Technician)
            {
                action("Technician List")
                {
                    Caption = 'Technician List';
                    RunObject = page "Technician List page";
                    ApplicationArea = All;
                }
                action(Problems)
                {
                    Caption = 'Problems';
                    RunObject = page Problems;
                    ApplicationArea = All;
                }
            }

        }
    }
}
