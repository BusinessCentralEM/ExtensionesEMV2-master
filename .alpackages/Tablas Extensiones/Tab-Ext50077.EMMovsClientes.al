tableextension 50077 EMMovsClientes extends "Cust. Ledger Entry"
{
    fields
    {
        field(50003; NroSerieRecibo; Code[70])
        {
            Caption = 'NroSerieRecibo';
            DataClassification = ToBeClassified;
        }
        field(50040; EnvioCorreo; Boolean)
        {

        }
        field(50041; Banco; Enum ENUMBancos)
        {

        }
        field(50042; FechaEmisionCheque; Date)
        {

        }

        field(50043; FechaVencimientoCheque; Date)
        {

        }

        field(50004; MesCobertura; Enum EM_Meses)
        {
            Caption = 'Mes Cobertura';
            DataClassification = ToBeClassified;
        }
        field(50005; UltimoCorreoEnviadoFecha; Date)
        {
            Caption = 'Ultimo Correo Enviado Fecha';
            DataClassification = ToBeClassified;
        }
        field(50006; EnvioRecibo; Enum ENUMEnvioRecibo)
        {
            Caption = 'Envio de recibo';
            DataClassification = ToBeClassified;
        }
        field(50007; RegularizacionRecibos; Boolean)
        {
            Caption = 'Regularizacion de recibos';
            DataClassification = ToBeClassified;

        }
    }
}
