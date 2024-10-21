pageextension 50275 EMDiarioPeriodicoProyecto extends "Recurring Job Jnl."
{
    layout
    {
        addafter("Posting Date")
        {
            field(FechaInicio; Rec.FechaCreacionFORMAT)
            {
                Caption = 'Fecha de Inicio';
                ApplicationArea = all;
            }
        }
    }
}
