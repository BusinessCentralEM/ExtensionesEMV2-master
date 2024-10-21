pageextension 50277 EMClientes extends "Customer Card"
{
    layout
    {
        addafter(Sectorizado)
        {
            field(NotiicarCliente; Rec.NotiicarCliente)
            {
                ApplicationArea = all;

            }
        }
        addafter("E-Mail")
        {
            field(CorreoRecibo; Rec.CorreoRecibo)
            {
                ApplicationArea = ALL;
            }
        }
    }
}
