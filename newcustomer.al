codeunit 50120 MyPublishers
{
    [IntegrationEvent(false, false)]
    procedure OnAfterNewCustomerCreated(line: Text[50])
    begin

    end;
}


codeunit 50124 MyScbscribers
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, codeunit::"MyPublishers", 'OnAfterNewCustomerCreated', '', true, true)]
    procedure CheckCustomerNameOnAfterNewCustomerCreated(line: Text[50])
    begin
        Message('New Customer %1 has been Created', line);
    end;
}
