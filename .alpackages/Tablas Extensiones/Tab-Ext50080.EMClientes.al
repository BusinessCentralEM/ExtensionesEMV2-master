tableextension 50085 EMClientes extends Customer
{
    fields
    {
        field(50029; NotiicarCliente; Boolean)
        {
            Caption = 'NotiicarCliente';
            DataClassification = ToBeClassified;
        }

        field(50030; CorreoCobranzas; Boolean)
        {
            Caption = 'Correo Cobranzas';
            DataClassification = ToBeClassified;
        }
        field(50031; CorreoRecibo; Text[150])
        {
            Caption = 'Correo Recibos';
            DataClassification = ToBeClassified;
        }
    }
}
