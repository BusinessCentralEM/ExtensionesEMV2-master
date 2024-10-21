page 50179 APIRequerimientoDePagoCobranza
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiRequerimientoDePagoCobranza';
    DelayedInsert = true;
    EntityName = 'APIRequerimientoDePagoCobranza';
    EntitySetName = 'APIRequerimientoDePagoCobranza';
    PageType = API;
    SourceTable = EMCobranzaCabecera;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(fechaMaxVenc; Rec.FechaMaxVenc)
                {
                    Caption = 'Fecha Max Vencimiento';
                }
                field(fechaCobro; Rec.FechaCobro)
                {
                    Caption = 'Fecha Cobro Agendado';
                }
                field(diasAtraso; Rec.DiasAtraso)
                {
                    Caption = 'Dias Atraso';
                }
                field(customerNo; Rec."Customer No")
                {
                    Caption = 'Customer No';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Estado';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(facturaFSica; Rec."Factura física")
                {
                    Caption = 'Factura física';
                }
                field(facturas; Rec.Facturas)
                {
                    Caption = 'Facturas';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
            }
        }
    }
}
