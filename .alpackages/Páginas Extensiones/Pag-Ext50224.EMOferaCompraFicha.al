pageextension 50224 EMOfertaCompraFicha extends "Purchase Quote"
{
    layout
    {
        addafter(Status)
        {
            field(FechaAprobacionGcia; Rec.FechaAprobacionGcia)
            {
                ApplicationArea = all;
                Caption = 'Fecha Aprobación Gcia.';
            }
        }
    }
}
