page 50171 EMLineasPedidoVenta
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'emLineasPedidoVenta';
    DelayedInsert = true;
    EntityName = 'EMLineasPedidoVenta';
    EntitySetName = 'EMLineasPedidoVenta';
    PageType = API;
    SourceTable = "Sales Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field("DocumentNo"; Rec."Document No.")
                {

                }
            }
        }
    }
}
