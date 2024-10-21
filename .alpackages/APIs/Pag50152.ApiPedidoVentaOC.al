page 50152 ApiPedidoVentaOC
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiPedidoVentaOC';
    DelayedInsert = true;
    EntityName = 'ApiPedidoVentaOC';
    EntitySetName = 'ApiPedidoVentaOC';
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(systemID; Rec.SystemId)
                {
                    Caption = 'systemID';
                }
                field(SelltoCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'SelltoCustomerNo';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'documentType';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                /*field(Facturar50; Rec.EMFactura50OCA)
                {
                    Caption = 'Facturar50';
                }
                field(FechaFinServicioOCA; Rec.EMFechaFinServicioOCA)
                {
                    Caption = 'FechaFinServicioOCA';
                }*/
                /* field(OCCliente; Rec.ExNroOCliente)
                 {
                     Caption = 'OCCliente';
                 }*/
                field(EMMigracion; rec.EMMigracion)
                {
                    Caption = 'Migracion';
                }
                field(NombrePS; rec."Operation Description")
                {
                    Caption = 'NombrePS';
                }
                field(RUC; rec."VAT Registration No.")
                {
                    Caption = 'RUC';
                }
                field(Proyecto; Proyecto)
                {
                    Caption = 'Proyecto';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        //Buscar Cliente requiere OC    
        Cliente.Reset();
        Cliente.SetRange("No.", rec."Sell-to Customer No.");
        Cliente.SetRange(ExReqOC, true);
        if Cliente.FindSet() then begin
            rec.SetRange("Sell-to Customer No.", Cliente."No.");
            rec.SetRange(rec."Document Type", rec."Document Type"::Order);
            rec.Setrange(REC.EMMigracion, false);
            rec.SetFilter(REC."Document Type", '<>%1', "Sales Document Type"::"Credit Memo");
            //Buscar Nombre de dimension
            DimensionCode.RESET();
            DimensionCode.SetRange(Code, rec."Shortcut Dimension 2 Code");
            DimensionCode.SetFilter("Dimension Code", '%1', 'PS');
            if DimensionCode.FindSet() then
                NombreDimension := DimensionCode.Name
            else
                clear(NombreDimension);
            rec."Operation Description" := NombreDimension;
            //Buscar Proyecto
            SalesLine.RESET;
            SalesLine.SetRange("Document No.", rec."No.");
            if SalesLine.FindSet() then begin
                proyecto := SalesLine."Job No.";
            end
            else
                clear(Proyecto)


        end
        else
            rec.Next()

    end;



    var
        NombreDimension: text[50];
        DimensionCode: record "Dimension Value";
        CodCliente: code[20];
        SalesLine: record "Sales Line";
        Cliente: Record Customer;
        RequiereOC: Boolean;
        Proyecto: code[30];
}