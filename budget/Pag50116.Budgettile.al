namespace Training.Training;
using Microsoft.Finance.GeneralLedger.Budget;
using Microsoft.Finance.Analysis;

page 50116 "Budget tile"
{
    ApplicationArea = All;
    Caption = 'Budget tile';
    PageType = CardPart;
    SourceTable = Category;

    layout
    {
        area(Content)
        {
            cuegroup(Budget)
            {
                Caption = 'General';
                field(currentYear; currentYear)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        Budget: Record "Budget Table";

                    begin


                        Budget.Reset();
                        Budget.SetRange("Expense Category", Rec.Name);
                        Startdate := DMY2Date(1, 1, Year);
                        Enddate := DMY2Date(31, 12, Year);
                        Budget.SetRange("From Date", Startdate, Enddate);
                        Budget.SetRange("To Date", Startdate, Enddate);
                        page.RunModal(Page::"Budget List", Budget);


                    end;
                }
                field(Currentmonth; Currentmonth)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        Budget: Record "Budget Table";

                    begin
                        Budget.Reset();
                        Budget.SetRange("Expense Category", Rec.Name);
                        startdate := DMY2Date(1, Month, year);
                        Enddate := CalcDate('<CM>', WorkDate());
                        Budget.SetRange("From Date", Startdate, Enddate);
                        Budget.SetRange("To Date", Startdate, Enddate);
                        page.RunModal(Page::Budget, Budget);

                    end;
                }
                field(CurrentHalfyear; CurrentHalfyear)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        Budget: Record "Budget Table";

                    begin
                        Budget.Reset();
                        Budget.SetRange("Expense Category", Rec.Name);
                        if Month <= 6 then begin
                            Startdate := DMY2Date(1, 1, Year);
                            Enddate := DMY2Date(30, 6, Year);

                        end else begin

                            Startdate := DMY2Date(1, 7, Year);
                            Enddate := DMY2Date(31, 12, Year);
                        end;

                        Budget.SetRange("From Date", Startdate, Enddate);
                        Budget.SetRange("To Date", Startdate, Enddate);

                    end;
                }
                field(CurrentQuaterly; CurrentQuaterly)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        Budget: Record "Budget Table";
                    begin
                        Budget.Reset();
                        Budget.SetRange("Expense Category", Rec.Name);

                        case month of
                            1 .. 3:
                                begin
                                    Startdate := DMY2Date(1, 1, year);
                                    Enddate := DMY2Date(31, 3, year);
                                end;
                            4 .. 6:
                                begin
                                    Startdate := DMY2Date(1, 4, year);
                                    Enddate := DMY2Date(30, 6, year);
                                end;
                            7 .. 9:
                                begin
                                    Startdate := DMY2Date(1, 7, year);
                                    Enddate := DMY2Date(30, 9, year);
                                end;
                            10 .. 12:
                                begin
                                    Startdate := DMY2Date(1, 10, year);
                                    Enddate := DMY2Date(31, 12, year);
                                end;

                        end;
                        Budget.SetRange("From Date", Startdate, Enddate);
                        Budget.SetRange("To Date", Startdate, Enddate);
                        page.RunModal(Page::Budget, Budget);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Budget: Record "Budget Table";

    begin
        Month := Date2DMY(WorkDate(), 2);
        Year := Date2DMY(WorkDate(), 3);
        // Current Year
        Budget.Reset();
        Budget.SetRange("Expense Category", Rec.Name);
        StartDate := DMY2DATE(1, 1, Year);
        EndDate := DMY2DATE(31, 12, Year);
        Budget.SetRange("From Date", Startdate, Enddate);
        Budget.SetRange("To Date", Startdate, Enddate);
        Budget.CalcSums("Budget Amount");
        CurrentYear := Budget."Budget Amount";

        // Current Month
        Budget.Reset();
        Budget.SetRange("Expense Category", Rec.Name);
        StartDate := DMY2DATE(1, Month, Year);
        EndDate := CALCDATE('<CM>', WorkDate()); // last day of current month
        Budget.SetRange("From Date", Startdate, Enddate);
        Budget.SetRange("To Date", Startdate, Enddate);
        Budget.CalcSums("Budget Amount");
        CurrentMonth := Budget."Budget Amount";

        // Current Half-Year
        Budget.Reset();
        Budget.SetRange("Expense Category", Rec.Name);
        if Month <= 6 then begin
            StartDate := DMY2DATE(1, 1, Year);
            EndDate := DMY2DATE(30, 6, Year);
        end else begin
            StartDate := DMY2DATE(1, 7, Year);
            EndDate := DMY2DATE(31, 12, Year);
        end;
        Budget.SetRange("From Date", Startdate, Enddate);
        Budget.SetRange("To Date", Startdate, Enddate);
        Budget.CalcSums("Budget Amount");
        CurrentHalfYear := Budget."Budget Amount";

        // Current Quarter
        Budget.Reset();
        Budget.SetRange("Expense Category", Rec.Name);
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
        Budget.SetRange("From Date", Startdate, Enddate);
        Budget.SetRange("To Date", Startdate, Enddate);
        Budget.CalcSums("Budget Amount");
        CurrentQuaterly := Budget."Budget Amount";
    end;

    var
        currentYear: Decimal;
        Currentmonth: Decimal;
        CurrentHalfyear: Decimal;
        CurrentQuaterly: Decimal;
        Month: integer;
        Year: Integer;

        Startdate: Date;
        Enddate: Date;
        Today: Date;

}
