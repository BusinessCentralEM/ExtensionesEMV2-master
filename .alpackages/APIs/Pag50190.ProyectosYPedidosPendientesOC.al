page 50190 ProyectosYPedidosPendientesOC
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'proyectosYPedidosPendientesOC';
    DelayedInsert = true;
    EntityName = 'ProyectosYPedidosPendientesOC';
    EntitySetName = 'ProyectosYPedidosPendientesOC';
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(refacturacion; Rec.Refacturacion)
                {
                    Caption = 'Refacturacion';
                }
                field(sellToContact; Rec."Sell-to Contact")
                {
                    Caption = 'Sell-to Contact';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(operationDescription; Rec."Operation Description")
                {
                    Caption = 'Operation Description';
                }
                field(emMesCobertura; Rec.EMMesCobertura)
                {
                    Caption = 'EMMesCobertura';
                }
                field(operationDescription2; Rec."Operation Description 2")
                {
                    Caption = 'Operation Description 2';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(pricesIncludingVAT; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                }
                field(fechaProvision; Rec.FechaProvision)
                {
                    Caption = 'Fecha de provision';
                }
            }
        }
    }
}
