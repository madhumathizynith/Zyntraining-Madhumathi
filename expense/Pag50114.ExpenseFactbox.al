page 50175 "Expense FactBox"
{
    PageType = CardPart;
    SourceTable = Category;
    ApplicationArea = All;
    Caption = 'Category Expense Info';

    layout
    {
        area(content)
        {
            cuegroup("Category Expense Info")
            {
                field("Current Year"; CurrentYear)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Current Year';
                    ToolTip = 'Total expenses for the current year';
                    trigger OnDrillDown()
                    var
                        Expense: Record "Expense Table";
                    begin
                        Expense.Reset();
                        Expense.SetRange("Category", Rec.Name);
                        StartDate := DMY2DATE(1, 1, Year);
                        EndDate := DMY2DATE(31, 12, Year);
                        Expense.SetRange("Date", StartDate, EndDate);
                        PAGE.RunModal(PAGE::"Expense List", Expense);
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
                        Expense: Record "Expense Table";
                    begin
                        Expense.Reset();
                        Expense.SetRange("Category", Rec.Name);
                        StartDate := DMY2DATE(1, Month, Year);
                        EndDate := CALCDATE('<CM>', WorkDate()); // last day of current month
                        Expense.SetRange("Date", StartDate, EndDate);
                        PAGE.RunModal(PAGE::"Expense List", Expense);
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
                        Expense: Record "Expense Table";
                    begin
                        Expense.Reset();
                        Expense.SetRange("Category", Rec.Name);

                        if Month <= 6 then begin
                            StartDate := DMY2DATE(1, 1, Year);
                            EndDate := DMY2DATE(30, 6, Year);
                        end else begin
                            StartDate := DMY2DATE(1, 7, Year);
                            EndDate := DMY2DATE(31, 12, Year);
                        end;

                        Expense.SetRange("Date", StartDate, EndDate);
                        PAGE.RunModal(PAGE::"Expense List", Expense);
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
                        Expense: Record "Expense Table";
                    begin
                        Expense.Reset();
                        Expense.SetRange("Category", Rec.Name);

                        case Month of
                            1 .. 3:
                                begin
                                    StartDate := DMY2DATE(1, 1, Year);
                                    EndDate := DMY2DATE(31, 3, Year);
                                end;
                            4 .. 6:
                                begin
                                    StartDate := DMY2DATE(1, 4, Year);
                                    EndDate := DMY2DATE(30, 6, Year);
                                end;
                            7 .. 9:
                                begin
                                    StartDate := DMY2DATE(1, 7, Year);
                                    EndDate := DMY2DATE(30, 9, Year);
                                end;
                            else begin
                                StartDate := DMY2DATE(1, 10, Year);
                                EndDate := DMY2DATE(31, 12, Year);
                            end;
                        end;

                        Expense.SetRange("Date", StartDate, EndDate);
                        PAGE.RunModal(PAGE::"Expense List", Expense);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Expense: Record "Expense Table";
    begin
        Month := DATE2DMY(WorkDate(), 2);
        Year := DATE2DMY(WorkDate(), 3);

        // Current Year
        Expense.Reset();
        Expense.SetRange("Category", Rec.Name);
        StartDate := DMY2DATE(1, 1, Year);
        EndDate := DMY2DATE(31, 12, Year);
        Expense.SetRange("Date", StartDate, EndDate);
        Expense.CalcSums(Amount);
        CurrentYear := Expense.Amount;

        // Current Month
        Expense.Reset();
        Expense.SetRange("Category", Rec.Name);
        StartDate := DMY2DATE(1, Month, Year);
        EndDate := CALCDATE('<CM>', WorkDate()); // last day of current month
        Expense.SetRange("Date", StartDate, EndDate);
        Expense.CalcSums(Amount);
        CurrentMonth := Expense.Amount;

        // Current Half-Year
        Expense.Reset();
        Expense.SetRange("Category", Rec.Name);
        if Month <= 6 then begin
            StartDate := DMY2DATE(1, 1, Year);
            EndDate := DMY2DATE(30, 6, Year);
        end else begin
            StartDate := DMY2DATE(1, 7, Year);
            EndDate := DMY2DATE(31, 12, Year);
        end;
        Expense.SetRange("Date", StartDate, EndDate);
        Expense.CalcSums(Amount);
        CurrentHalfYear := Expense.Amount;

        // Current Quarter
        Expense.Reset();
        Expense.SetRange("Category", Rec.Name);
        case Month of
            1 .. 3:
                begin
                    StartDate := DMY2DATE(1, 1, Year);
                    EndDate := DMY2DATE(31, 3, Year);
                end;
            4 .. 6:
                begin
                    StartDate := DMY2DATE(1, 4, Year);
                    EndDate := DMY2DATE(30, 6, Year);
                end;
            7 .. 9:
                begin
                    StartDate := DMY2DATE(1, 7, Year);
                    EndDate := DMY2DATE(30, 9, Year);
                end;
            else begin
                StartDate := DMY2DATE(1, 10, Year);
                EndDate := DMY2DATE(31, 12, Year);
            end;
        end;
        Expense.SetRange("Date", StartDate, EndDate);
        Expense.CalcSums(Amount);
        CurrentQuarter := Expense.Amount;
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
