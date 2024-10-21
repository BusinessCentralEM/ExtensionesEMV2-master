table 50017 EMComentariosCobranzasLineas
{
    Caption = 'EMComentariosCobranzasLineas';
    DataClassification = ToBeClassified;
    DrillDownPageID = EMComentariosCobranzas;
    LookupPageID = EMComentariosCobranzas;
    fields
    {
        field(1; Fecha; Date)
        {
            Caption = 'Fecha';
            DataClassification = ToBeClassified;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(3; Comentario; Text[300])
        {
            Caption = 'Comentario';
            DataClassification = ToBeClassified;
        }
        field(4; "Usuario Autor"; Text[50])
        {
            Caption = 'Usuario Autor';
            DataClassification = ToBeClassified;
        }
        field(5; NroLinea; Integer)
        {
            Caption = 'NroLinea';
            DataClassification = ToBeClassified;
        }
        field(6; NombreCliente; Text[50])
        {
            Caption = 'NombreCliente';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.", NroLinea)
        {
            Clustered = true;
        }
    }

}
