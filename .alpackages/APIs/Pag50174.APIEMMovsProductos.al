page 50177 APIEMMovsProductos
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiemMovsProductos';
    DelayedInsert = true;
    EntityName = 'APIEMMovsProductos';
    EntitySetName = 'APIEMMovsProductos';
    PageType = API;
    SourceTable = "Item Ledger Entry";
    InsertAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FechaRegistro; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(TipoMovimiento; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }
                field(TipoDocumento; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(NroDocumento; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(Producto; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(CodAlmacen; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(Cantidad; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(CodProcedencia; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(DimensionUN; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(DimensionPS; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(CantidadFacturada; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                }
                field(CantidadPendiente; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                }
                field(ImporteVentas; Rec."Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                }
                field(ImporteCosto; Rec."Cost Amount (Actual)")
                {
                    Caption = 'Cost Amount (Actual)';
                }
                field(Abierto; Rec.Open)
                {
                    Caption = 'Open';
                }
                field(TipoOrden; Rec."Order Type")
                {
                    Caption = 'Order Type';
                }
                field(NoMovimiento; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(CodLegajo; Rec.CodLegajo)
                {
                    Caption = 'Cod Legajo';
                }
                field(Estado; Rec.Estado)
                {

                }
            }

        }
    }
    trigger OnInit()
    var
        fechafiltro: date;
    begin
        fechafiltro := today;
        fechafiltro := calcdate('-3M', fechafiltro);
        REC.SetFilter("Posting Date", '>%1', fechafiltro);
        //REC.SetFilter("Document No.", '<>%1', '001-002-150005369');
        //REC.SetRange("Posting Date", 20231201D, 20240331D);

    end;
}
