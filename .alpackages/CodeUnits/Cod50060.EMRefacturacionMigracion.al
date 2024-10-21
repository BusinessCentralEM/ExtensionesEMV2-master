codeunit 50060 EMRefacturacionMigracion
{
    TableNo = "Sales Header";
    Permissions = tabledata "Sales Invoice Header" = RIMD;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnInsertInvoiceHeaderOnAfterSalesInvHeaderTransferFields', '', true, true)]
    local procedure OnInsertInvoiceHeaderOnAfterSalesInvHeaderTransferFields(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        SalesInvoiceHeader.Refacturacion := SalesHeader.Refacturacion;
    end;


}