page 50185 APIOC
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apioc';
    DelayedInsert = true;
    EntityName = 'APIOC';
    EntitySetName = 'APIOC';
    PageType = API;
    SourceTable = EM_OC;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(codigoCliente; Rec.CodigoCliente)
                {
                    Caption = 'CodCliente';
                }
                field(descripcion; Rec.Descripcion)
                {
                    Caption = 'Descripcion';
                }
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(montoOrdenCompra; Rec.MontoOrdenCompra)
                {
                    Caption = 'MontoOC';
                }
                field(montoAFacturar; Rec.MontoAFacturar)
                {
                    Caption = 'MontoAFacturar';
                }
                field(nombreCliente; Rec.NombreCliente)
                {
                    Caption = 'NombreCliente';
                }
                field(nroFactura; Rec.NroFactura)
                {
                    Caption = 'Factura';
                }
                field(nroProyecto; Rec.NroProyecto)
                {
                    Caption = 'NroProyecto';
                }
                field(nroTareaProyecto; Rec.NroTareaProyecto)
                {
                    Caption = 'NroTareaProyecto';
                }
                field(periodoFacturacion; Rec.PeriodoFacturacion)
                {
                    Caption = 'PeriodoFacturacion';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Estado';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(MesAnhoOC; MesAnhoOC)
                {

                }

                field(NumeroDePedido; Rec.NumeroDePedido)
                {

                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        MesAnhoOC := Format(Date2DMY(rec.PeriodoFacturacion, 2)) + '/' + Format(Date2DMY(rec.PeriodoFacturacion, 3));

    end;

    var
        MesAnhoOC: Text[20];
}
