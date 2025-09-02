namespace Training.Training;

report 50103 "Expense Report"
{
    ApplicationArea = All;
    Caption = 'Expense Report';
    UsageCategory = ReportsAndAnalysis;
    ExcelLayout = 'Expense report.xlsx';
    DefaultLayout = Excel;
    ProcessingOnly = false;

    dataset
    {
        dataitem(ExpenseTable; "Expense Table")
        {
            RequestFilterFields = Date;

            column("ExpenseId"; "Expense Id") { }
            column(Description; Description) { }
            column(Category; Category) { }
            column(Amount; Amount) { }
            column(Date; "Date") { }

            trigger OnPreDataItem()
            begin
                if FromDate <> 0D then
                    SetRange(Date, FromDate, EndDate);
                if Categoryfilter <> '' then
                    SetRange(Category, Categoryfilter);
            end;

            trigger OnAfterGetRecord()
            begin
                if (Categoryfilter = '') or (Category = Categoryfilter) then
                    TotalExpense += Amount;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Expected Expenses")
                {
                    field("From Date"; FromDate) { }
                    field("End Date"; EndDate) { }
                    field("Category"; Categoryfilter) { }
                    field("Total Expenses"; TotalExpense)
                    {
                        Editable = false;
                    }
                }
            }
        }
    }

    procedure SetCategoryFilter(Value: Text)
    begin
        Categoryfilter := Value;
    end;

    procedure SetDateFilter(FromD: Date; EndD: Date)
    begin
        FromDate := FromD;
        EndDate := EndD;
    end;

    var
        FromDate: Date;
        EndDate: Date;
        Categoryfilter: Text;
        TotalExpense: Decimal;
}
