page 50160 ApiCobranzaCabecera
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiCobranzaCabecera';
    DelayedInsert = true;
    EntityName = 'ApiCobranzaCabecera';
    EntitySetName = 'ApiCobranzaCabecera';
    PageType = API;
    SourceTable = EMCobranzaCabecera;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(asignado; Rec.Asignado2)
                {
                    Caption = 'Asignado';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(customerNo; Rec."Customer No")
                {
                    Caption = 'Customer No';
                }
                field(diasCobro; Rec.DiasCobro)
                {
                    Caption = 'Dias de Cobro';
                }
                field(ejecutivo; Rec.Ejecutivo)
                {
                    Caption = 'Ejecutivo';
                }
                field(montoPendiente; Rec.MontoPendiente)
                {
                    Caption = 'MontoPendiente';
                }
                field(nombreContacto; Rec.NombreContacto)
                {
                    Caption = 'Nombre Contacto';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Estado';
                }
                field(telefono; Rec.Telefono)
                {
                    Caption = 'Telefono';
                }
                field(unidadNegocio; Rec.UnidadNegocio)
                {
                    Caption = 'Unidad Negocio';
                }
                field(Correo; Rec.Correo)
                {
                    Caption = 'Correo';
                }
            }
        }
    }
    trigger OnInit()


    begin
        rec.SetRange(Status, rec.Status::Escalamiento);

    end;
}
