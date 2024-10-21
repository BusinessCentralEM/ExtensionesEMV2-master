page 50150 EM_PendienteOCProyectoPedidos
{
    ApplicationArea = All;
    Caption = 'Proyectos y Pedidos pendientes de OC';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = Lists;
    SourceTableView = WHERE(Status = filter(1));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the estimate.';
                    TableRelation = "Sales Header" where("No." = field("No."));
                    DrillDownPageId = 45;
                    ApplicationArea = all;

                }
                field("Ventas a N° cliente"; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
                }
                field("Venta a Nombre"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the customer''s name.';
                }


                field("N° de Documento externo"; Rec."External Document No.")
                {
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field(Refacturacion; Rec.Refacturacion)
                {
                    ToolTip = 'Specifies the value of the Refacturacion field.', Comment = '%';
                }
                field("Venta a Atención"; Rec."Bill-to Contact")
                {
                    ToolTip = 'Specifies the name of the contact person at the billing address';
                }
                field("Nuestra referencia"; Rec."Your Reference")
                {
                    ToolTip = 'Specifies the customer''s reference. The content will be printed on sales documents.';
                }
                FIELD(DescripcionProyecto; DescripcionProyecto)
                {

                }
                field(Periodo; Periodo)
                {

                }
                field("Termino de pago"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Fecha de registro"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("Fecha de pedido"; Rec."Order Date")
                {

                }
                field("Operation Description"; Rec."Operation Description")
                {

                }
                field(EMMesCobertura; Rec.EMMesCobertura)
                {

                }
                field("Ejecutivo"; Rec."Operation Description 2")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field(NumeroOC; Rec.NumeroOC)
                {
                    Caption = 'Número de OC';

                }
                field("Correo"; Rec."Sell-to E-Mail")
                {

                }

                field("Cod. Almacen"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
                field("Fecha de Vencimiento"; Rec."Due Date")
                {
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                }
                field(Importe; Rec.Amount)
                {
                    ToolTip = 'Specifies the total amount on the sales invoice excluding VAT.';
                }
                field("Importe IVA incluido"; Rec."Amount Including VAT")
                {
                    ToolTip = 'Specifies the total amount on the sales invoice including VAT.';
                }
                field("IVA Incluido"; Rec."Prices Including VAT")
                {
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                }
                field(FechaProvisionado; Rec.FechaProvisionado)
                {

                }
                field(RequiereOC; RequiereOC)
                {

                }


            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Proyectos: Record Job;
        Customer: Record Customer;
        MovsContabilidad: Record "G/L Entry";
        OrdenCompra: Record EM_OC;
        LineasFactura: Record "Sales Line";
    begin
        rec.SetFilter("Document Type", '<>%1', rec."Document Type"::"Credit Memo");
        rec.setfilter("Payment Method Code", '<>%1&<>%2', 'UNIFORME', 'BAJA STOCK');
        LineasFactura.reset();
        LineasFactura.Setrange("Document No.", rec."No.");
        if LineasFactura.FindFirst() then Begin
            Periodo := LineasFactura.Description;
        End;

        /*  if rec.FechaProvisionado = 0D then begin

              rec.FechaProvisionado := BuscarProvision(rec."No.");
              rec.Modify();
          end;*/




        Customer.Reset();
        Customer.SetRange("No.", rec."Sell-to Customer No.");
        If Customer.findset then begin
            RequiereOC := customer.ExReqOC;
        end;
        OrdenCompra.Reset();
        OrdenCompra.SetRange(NumeroDePedido, REC."No.");
        if OrdenCompra.FindSet() then begin
            rec.NumeroOC := OrdenCompra.NroOrden;
            REC.Modify();
        end
        else
            REC.NumeroOC := '';
        rec.Modify();
        Proyectos.reset;
        Proyectos.SetRange("No.", rec."Your Reference");
        if Proyectos.findset then
            DescripcionProyecto := Proyectos.Description;




    end;

    /* trigger OnInit()
     begin

         repeat

             if rec.FechaProvision = 0D then begin
                 rec.FechaProvision := BuscarProvision(rec."No.");
                 rec.Modify();


             end;

         until rec.next = 0;

     end;*/

    local procedure BuscarProvision(NroFactura: code[20]): Date
    var
        MovsContabilidad: Record "G/L Entry";
    begin
        MovsContabilidad.Reset();
        MovsContabilidad.SetRange(Description, rec."No.");
        if MovsContabilidad.FindFirst() then begin
            exit(MovsContabilidad."Posting Date");

        end
        else
            Clear(rec.FechaProvision);




    end;
    /*  trigger OnAfterGetRecord()
      var
          MovsContabilidad: Record "G/L Entry";
      begin
          MovsContabilidad.Reset();
          MovsContabilidad.SetRange(Description, rec."No.");
          if MovsContabilidad.FindFirst() then begin
              rec.FechaProvision := MovsContabilidad."Posting Date";
              rec.Modify();
          end
          else
              Clear(rec.FechaProvision);

      end;*/


    var
        RequiereOC: Boolean;
        DescripcionProyecto: Text[100];
        Periodo: Text[100];
}
