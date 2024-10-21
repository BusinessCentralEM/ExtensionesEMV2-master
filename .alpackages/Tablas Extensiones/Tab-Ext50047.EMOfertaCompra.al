tableextension 50047 EMOfertaCompra extends "Purchase Header"
{
    fields
    {
        field(50015; CorreoEnviado; Boolean)
        {
            Caption = 'CorreoEnviado';
            DataClassification = ToBeClassified;
        }
        field(50016; CorreoEnviadoGerente; Boolean)
        {
            Caption = 'CorreoEnviadoGerente';
            DataClassification = ToBeClassified;
        }
        field(50017; CorreoEnviadoDirector; Boolean)
        {
            Caption = 'CorreoEnviadoDirector';
            DataClassification = ToBeClassified;
        }
    }
}
