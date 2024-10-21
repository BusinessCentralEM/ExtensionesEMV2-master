pageextension 50231 EMFacturaVentaLista extends "Sales Invoice List"
{
    layout
    {
        addbefore("Sell-to Contact")
        {
            field(Refacturacion; Rec.Refacturacion)
            {
                ApplicationArea = ALL;
                Caption = 'Es refacturación';
            }
        }
    }
}
