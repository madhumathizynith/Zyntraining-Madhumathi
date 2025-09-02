report 50131 "Income Report"
{
    ApplicationArea = All;
    Caption = 'Income Report';
    UsageCategory = ReportsAndAnalysis;
    ExcelLayout = 'Income report.xlsx';
    DefaultLayout = Excel;
    ProcessingOnly = false;

    dataset
    {
        dataitem(ExpenseTable; "Income Table")
        {
            RequestFilterFields = Date;

            column("IncomeId"; "Income Id") { }
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
                    TotalIncome += Amount;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Expected Income")
                {
                    field("From Date"; FromDate) { }
                    field("End Date"; EndDate) { }
                    field("Category"; Categoryfilter) { }
                    field("Total Income"; TotalIncome)
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
        TotalIncome: Decimal;
}
