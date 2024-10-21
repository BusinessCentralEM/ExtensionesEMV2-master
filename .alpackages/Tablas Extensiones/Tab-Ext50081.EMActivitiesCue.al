tableextension 50081 "EMActivitiesCue" extends "Activities Cue"
{
    fields
    {
        field(50006; PendienteEjecutor2; Integer)
        {
            CalcFormula = count("EM_ControlFacturacion" where(Estado = filter(ConfirmarInicioEjecutor | RegistrarRealizado)));
            Caption = 'Ongoing Sales Orders';
            FieldClass = FlowField;
        }
        field(50007; PendientesOCConsolidado; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Invoice | Order),
            "Payment Method Code" = filter(<> 'UNIFORME' & <> 'BAJA STOCK'),
            Status = filter(1)
            )

            );
            Caption = 'Pendientes de OC';
            FieldClass = FlowField;
        }
        field(50009; MontoPendienteADM; Decimal)
        {
            CalcFormula = Sum(EM_OC."MontoAFacturar" WHERE(Status = CONST(EMEstadoOC::Abierto)));
            Caption = 'Pendientes de OC ADM';
            FieldClass = FlowField;
        }
        field(50010; PendienteComercial; Integer)
        {
            CalcFormula = count("EM_ControlFacturacion" where(Estado = filter(ConfirmacionCliente), Tipo = filter(UNICAVEZ)));
            Caption = 'Pendientes Comercial';
            FieldClass = FlowField;
        }



    }
}
