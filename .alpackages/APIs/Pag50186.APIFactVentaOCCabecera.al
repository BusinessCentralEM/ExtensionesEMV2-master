page 50186 APIFactVentaOCCabecera
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiFactVentaOCCabecera';
    DelayedInsert = true;
    EntityName = 'APIFactVentaOCCabecera';
    EntitySetName = 'APIFactVentaOCCabecera';
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(FechaProvision; Rec.FechaProvision)
                {
                    Caption = 'Fecha de provision';
                }
            }
        }
    }
}
