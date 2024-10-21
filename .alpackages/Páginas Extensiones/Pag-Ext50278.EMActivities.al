pageextension 50282 EMActivities extends "O365 Activities"
{
    layout
    {
        modify(PendienteEnteEjecutor)
        {
            Visible = false;
        }
        modify(PendienteOC)
        {
            Visible = false;
        }
        modify(PendienteOC2)
        {
            Visible = false;
        }
        addfirst("Ongoing Sales")
        {
            field(PendientesOCConsolidado; Rec.PendientesOCConsolidado)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pendientes OC';
                DrillDownPageID = "EM_PendienteOCProyectoPedidos";

            }
            field(MontoPendienteADM; Rec.MontoPendienteADM)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pendientes de OCADM';
                DrillDownPageId = "Orden de Compra";
            }
            FIELD(PendienteComercial; Rec.PendienteComercial)
            {
                ApplicationArea = Basic, Suit;
                Caption = 'Pendientes Comercial';
                DrillDownPageId = "EM_ControlFacturacion";
            }
        }
        addafter(PendienteVerificacion)
        {
            field(PendienteEjecutor2; Rec.PendienteEjecutor2)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pendiente Vista ControlEjecutor';
                DrillDownPageID = "EM_ControlFacturacion";
                ToolTip = 'Specifies sales orders that are not yet posted or only partially posted.';

            }

        }
    }
}
