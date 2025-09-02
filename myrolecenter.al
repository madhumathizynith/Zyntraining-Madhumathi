page 50105 MyCustomerRoleCenter
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration; // Optional - controls where it shows in menus
    Caption = 'Customer Role Center';

    layout
    {
        area(RoleCenter)
        {
            part(CustomerCueTile; 50108)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Customers)
            {
                action(CustomerList)
                {
                    Caption = 'Customers List';
                    ApplicationArea = All;
                    RunObject = PAGE "Customer List";
                    Image = Customer;
                }
            }
        }

    }
}

