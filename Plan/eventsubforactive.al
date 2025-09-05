codeunit 50194 Inactiveplan
{
    [EventSubscriber(ObjectType::Table, Database::"Plan Table", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyPlan(var Rec: Record "Plan Table")
    var
        Sub: Record "Customer Subscription";
    begin
        if Rec."Plan Status" = Rec."Plan Status"::Inactive then begin
            Sub.Reset();
            Sub.SetRange("Plan ID", Rec."Plan ID");
            if Sub.FindSet() then
                repeat
                    Sub."Subscription Status" := Sub."Subscription Status"::Inactive;
                    Sub.Modify();
                until Sub.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Plan Table", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeletePlan(var Rec: Record "Plan Table"; RunTrigger: Boolean)
    var
        Sub: Record "Customer Subscription";
    begin
        Sub.Reset();
        Sub.SetRange("Plan ID", Rec."Plan ID");
        if Sub.FindSet() then
            repeat
                Sub."Subscription Status" := Sub."Subscription Status"::Inactive;
                Sub.Modify();
            until Sub.Next() = 0;
    end;

}

