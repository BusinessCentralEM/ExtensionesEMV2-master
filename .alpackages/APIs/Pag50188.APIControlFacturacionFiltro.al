page 50188 APIControlFacturacionFiltro
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiControlFacturacionFiltro';
    DelayedInsert = true;
    EntityName = 'APIControlFacturacionFiltro';
    EntitySetName = 'APIControlFacturacionFiltro';
    PageType = API;
    SourceTable = EM_ControlFacturacion;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(estado; Rec.Estado)
                {
                    Caption = 'Estado';
                }
                field(fechaInicioComercial; Rec.FechaInicioComercial)
                {
                    Caption = 'Fecha Inicio Comercial';
                }
                field(fechaInicioOperaciones; Rec.FechaInicioOperaciones)
                {
                    Caption = 'Fecha Inicio Operaciones';
                }
                field(fechaRegistro; Rec.FechaRegistro)
                {
                    Caption = 'Fecha Registro';
                }
                field(id; Rec.Id)
                {
                    Caption = 'Id';
                }
                field(montoFacturar; Rec.MontoFacturar)
                {
                    Caption = 'Monto a Facturar';
                }
                field(nroBalticNuevo; Rec.NroBalticNuevo)
                {
                    Caption = 'Baltic Nuevo';
                }
                field(nroBalticReemplazado; Rec.NroBalticReemplazado)
                {
                    Caption = 'Baltic Reemplazado';
                }
                field(nroPre; Rec.NroPre)
                {
                    Caption = 'Nro Oprtunidad CRM';
                }
                field(proyecto; Rec.Proyecto)
                {
                    Caption = 'Proyecto';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(tareaProyecto; Rec.TareaProyecto)
                {
                    Caption = 'Tarea Proyecto';
                }
                field(tipoPresupuesto; Rec.TipoPresupuesto)
                {
                    Caption = 'Tipo Presupuesto';
                }
                field(CodCliente; Rec.CodCliente)
                {
                    Caption = 'CodCliente';
                }
                field(Item; Rec.Item)
                {
                    Caption = 'Item';
                }
                field(PrecioUnitario; Rec.PrecioUnitario)
                {
                    Caption = 'Precio Unitario';
                }
                field(Cantidad; Rec.Cantidad)
                {
                    Caption = 'Cantidad';
                }
                FIELD(Puesto; Rec.Puesto)
                {
                    Caption = 'Puesto';
                }
                field(Sector; Rec.Sector)
                {
                    Caption = 'Sector';
                }
                field(CorreoEnviado; Rec.CorreoEnviado)
                {
                    Caption = 'CorreoEnviado';
                }
                field(FechaProvision; Rec.FechaProvision)
                {
                    Caption = 'FechaProvision';
                }

            }
        }
    }
    trigger OnInit()
    var
        PrimerProyecto: Code[30];

    begin
        PrimerProyecto := BuscarProyecto();
        rec.SetRange(Proyecto, PrimerProyecto);
        rec.SetRange(rec.Estado, rec.Estado::ConfirmacionCliente);




    end;


    local procedure BuscarProyecto(): Code[30]
    var
        ControlContrato: record EM_ControlFacturacion;

    BEGIN
        ControlContrato.Reset();
        ControlContrato.SetRange(Estado, rec.Estado::ConfirmacionCliente);
        ControlContrato.SetRange(CorreoEnviado, false);
        If ControlContrato.FindFirst() then
            exit(ControlContrato.Proyecto)



    END;

}