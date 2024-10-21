codeunit 50075 "Customer Add-Link"
{
    trigger OnRun()
    begin

    end;

    procedure addLink(CustomerNo: Code[50]; LinkUrl: Text; Desc: Text)
    var
        Customer: Record Customer;
    begin
        Customer.get(CustomerNo);
        Customer.AddLink(LinkUrl, Desc)
    end;

}
