codeunit 50108 CustomerChangeTracker
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnCustomerModify(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
    var
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        xFieldRef: FieldRef;
        ModifyLog: Record "ModifyTable";
        i: Integer;
        CurrentUser: Code[50];
        FieldName: Text[50];
    begin
        CurrentUser := UserId();

        RecRef.GetTable(Rec);
        xRecRef.GetTable(xRec);

        for i := 1 to RecRef.FieldCount do begin
            FieldRef := RecRef.FieldIndex(i);
            xFieldRef := xRecRef.FieldIndex(i);

            // Optional: Only track selected field numbers
            // if FieldRef.Number in [3,4,5,7,9,10,22,10000] then

            if Format(FieldRef.Value) <> Format(xFieldRef.Value) then begin
                FieldName := FieldRef.Name;

                ModifyLog.Init();
                ModifyLog."No." := Rec."No.";
                ModifyLog."Field" := FieldName;
                ModifyLog."OldValue" := Format(xFieldRef.Value);
                ModifyLog."NewValue" := Format(FieldRef.Value);
                ModifyLog."UserID" := CurrentUser;
                ModifyLog.Insert();
            end;
        end;
    end;
}
