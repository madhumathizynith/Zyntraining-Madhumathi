namespace Training.Training;

page 50153 "Expense Claim Card"
{
    ApplicationArea = All;
    Caption = 'Expense Claim Card';
    PageType = Card;
    SourceTable = "Expense Claim Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = All;
                }
                field(Subtype; Rec.Subtype)
                {
                    ApplicationArea = All;
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Bill; Rec.Bill)
                {
                    ApplicationArea = All;
                }
                field("Bill Date"; Rec."Bill Date")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Available amount"; Rec."Available amount")
                {

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Upload)
            {
                trigger OnAction()
                var
                    Instr: InStream;
                    Outstr: OutStream;
                    Filename: Text;
                begin
                    if UploadIntoStream('Select a file', '', '', Filename, Instr) then begin
                        Rec.Bill.CreateOutStream(Outstr);
                        CopyStream(Outstr, Instr);
                        Rec.Modify(true);
                        Message('Bill uploaded successfully');

                    end;
                end;
            }
            action(Download)
            {
                trigger OnAction()
                var
                    Instr: InStream;
                    Filename: Text;
                begin
                    Rec.CalcFields("Bill");
                    if Rec."Bill".HasValue then begin
                        Rec."Bill".CreateInStream(InStr);

                        DownloadFromStream(InStr, '', '', '', FileName);
                    end else
                        Message('No bill uploaded.');
                end;
            }
        }
    }
}
