pageextension 50227 EMOrdenCompras extends "Orden de Compra"
{
    layout
    {

        addafter(NumeroOrden)
        {
            /*field(Cliente; Cliente)
            {
                ApplicationArea = All;
                Caption = 'Cliente';
            }*/
            /* field(NroPre; NroPre)
             {
                 ApplicationArea = All;
                 Caption = 'Nro PRE';
                 Visible = false;
             }*/
        }
    }
    trigger OnAfterGetRecord()
    var
        PedidoVenta: Record "Sales Header";
        FacturaVenta: Record "Sales Invoice Header";
        Proyecto: Record Job;
    begin
        if (rec.NroFactura <> '') and (rec.NumeroDePedido <> 'Proyecto') then begin


            FacturaVenta.reset();
            FacturaVenta.SetRange("External Document No.", rec.NroFactura);
            if FacturaVenta.FindSet() then
                rec.NombreCliente := FacturaVenta."Bill-to Name";
            NroPre := FacturaVenta."Your Reference";
        end
        else

            if (rec.NroFactura = '') and (rec.NumeroDePedido <> 'Proyecto') then begin
                PedidoVenta.Reset();
                PedidoVenta.SetRange("No.", rec.NumeroDePedido);
                if PedidoVenta.FindSet() then
                    rec.NombreCliente := PedidoVenta."Bill-to Name";
                NroPre := PedidoVenta."Your Reference"

            end
            else
                if Rec.NumeroDePedido = 'Proyecto' then begin
                    Proyecto.Reset();
                    Proyecto.SetRange("No.", rec.NroProyecto);
                    if Proyecto.FindSet() then
                        rec.NombreCliente := Proyecto."Bill-to Name";
                end;

    end;

    var
        Cliente: text[100];
        NroPre: text[20];

}
