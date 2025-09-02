page 50178 "Income FactBox"
{
    PageType = CardPart;
    SourceTable = "Income Category";
    ApplicationArea = All;
    Caption = 'Category Income Info';

    layout
    {
        area(content)
        {
            cuegroup("Category Income Info")
            {
                field("Current Year"; CurrentYear)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Current Year';
                    ToolTip = 'Total Income for the current year';
                    trigger OnDrillDown()
                    var
                        Expense: Record "Expense Table";
                    begin
                        Expense.SetRange("Category", Rec.Name);
                        StartDate := DMY2DATE(1, 1, Year);
                        EndDate := DMY2DATE(31, 12, Year);
                        Expense.SetRange("Date", StartDate, EndDate);
                        PAGE.Run(PAGE::"Expense List", Expense);
                    end;
                }

                field("Current Month"; CurrentMonth)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Current Month';
                    ToolTip = 'Total expenses for the current month';
                    trigger OnDrillDown()
                    var
                        Income: Record "Income Table";
                    begin
                        Income.SetRange("Category", Rec.Name);
                        StartDate := DMY2DATE(1, Month, Year);
                        EndDate := WorkDate();
                        Income.SetRange("Date", StartDate, EndDate);
                        PAGE.Run(PAGE::"Income List", Income);
                    end;
                }

                field("Current Half Year"; CurrentHalfYear)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Current Half Year';
                    ToolTip = 'Total expenses for the current half-year';
                    trigger OnDrillDown()
                    var
                        Income: Record "Income Table";
                    begin
                        Income.SetRange("Category", Rec.Name);
                        if Month <= 6 then begin
                            StartDate := DMY2DATE(1, 1, Year);
                            EndDate := DMY2DATE(30, 6, Year);
                        end else begin
                            StartDate := DMY2DATE(1, 7, Year);
                            EndDate := DMY2DATE(31, 12, Year);
                        end;
                        Income.SetRange("Date", StartDate, EndDate);
                        PAGE.Run(PAGE::"Income List", Income);
                    end;
                }

                field("Current Quarter"; CurrentQuarter)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Current Quarter';
                    ToolTip = 'Total expenses for the current quarter';
                    trigger OnDrillDown()
                    var
                        Income: Record "Income Table";
                    begin
                        Income.SetRange("Category", Rec.Name);

                        if Month in [1 .. 3] then begin
                            StartDate := DMY2DATE(1, 1, Year);
                            EndDate := DMY2DATE(31, 3, Year);
                        end else if Month in [4 .. 6] then begin
                            StartDate := DMY2DATE(1, 4, Year);
                            EndDate := DMY2DATE(30, 6, Year);
                        end else if Month in [7 .. 9] then begin
                            StartDate := DMY2DATE(1, 7, Year);
                            EndDate := DMY2DATE(30, 9, Year);
                        end else begin
                            StartDate := DMY2DATE(1, 10, Year);
                            EndDate := DMY2DATE(31, 12, Year);
                        end;

                        Income.SetRange("Date", StartDate, EndDate);
                        PAGE.Run(PAGE::"Income List", Income);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Income: Record "Expense Table";
    begin
        Month := DATE2DMY(WorkDate(), 2);
        Year := DATE2DMY(WorkDate(), 3);

        // Current Year
        Income.Reset();
        Income.SetRange("Category", Rec.Name);
        StartDate := DMY2DATE(1, 1, Year);
        EndDate := DMY2DATE(31, 12, Year);
        Income.SetRange("Date", StartDate, EndDate);
        Income.CalcSums(Amount);
        CurrentYear := Income.Amount;

        // Current Month
        Income.Reset();
        Income.SetRange("Category", Rec.Name);
        StartDate := DMY2DATE(1, Month, Year);
        EndDate := WorkDate();
        Income.SetRange("Date", StartDate, EndDate);
        Income.CalcSums(Amount);
        CurrentMonth := Income.Amount;

        // Current Half-Year
        Income.Reset();
        Income.SetRange("Category", Rec.Name);
        if Month <= 6 then begin
            StartDate := DMY2DATE(1, 1, Year);
            EndDate := DMY2DATE(30, 6, Year);
        end else begin
            StartDate := DMY2DATE(1, 7, Year);
            EndDate := DMY2DATE(31, 12, Year);
        end;
        Income.SetRange("Date", StartDate, EndDate);
        Income.CalcSums(Amount);
        CurrentHalfYear := Income.Amount;

        // Current Quarter
        Income.Reset();
        Income.SetRange("Category", Rec.Name);
        if Month in [1 .. 3] then begin
            StartDate := DMY2DATE(1, 1, Year);
            EndDate := DMY2DATE(31, 3, Year);
        end else if Month in [4 .. 6] then begin
            StartDate := DMY2DATE(1, 4, Year);
            EndDate := DMY2DATE(30, 6, Year);
        end else if Month in [7 .. 9] then begin
            StartDate := DMY2DATE(1, 7, Year);
            EndDate := DMY2DATE(30, 9, Year);
        end else begin
            StartDate := DMY2DATE(1, 10, Year);
            EndDate := DMY2DATE(31, 12, Year);
        end;
        Income.SetRange("Date", StartDate, EndDate);
        Income.CalcSums(Amount);
        CurrentQuarter := Income.Amount;
    end;

    var
        CurrentYear: Decimal;
        CurrentMonth: Decimal;
        CurrentHalfYear: Decimal;
        CurrentQuarter: Decimal;
        StartDate: Date;
        EndDate: Date;
        Month: Integer;
        Year: Integer;
}

