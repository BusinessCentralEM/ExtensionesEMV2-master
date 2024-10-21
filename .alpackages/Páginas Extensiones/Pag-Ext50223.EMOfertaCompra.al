pageextension 50223 EMOfertaCompraV2 extends "Purchase Quotes"
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
