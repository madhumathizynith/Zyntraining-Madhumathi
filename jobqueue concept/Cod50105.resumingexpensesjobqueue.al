
codeunit 50105 "resuming expenses job queue"
{


    trigger OnRun()

    var
        resumerec: Record "Resuming Expenses";
    begin
        if resumerec.FindSet() then
            repeat
                if resumerec."Next Cycle Date" = Today then begin
                    resumerec.Validate(StartDate, resumerec."Next Cycle Date");
                    resumerec.Modify(true);
                end;
            until
            resumerec.Next() = 0;

    end;

}
