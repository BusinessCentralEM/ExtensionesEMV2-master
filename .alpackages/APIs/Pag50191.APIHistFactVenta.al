page 50191 APIHistFactVenta
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiHistFactVenta';
    DelayedInsert = true;
    EntityName = 'APIHistFactVenta';
    EntitySetName = 'APIHistFactVenta';
    PageType = API;
    SourceTable = "Sales Invoice Header";

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
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2")
                {
                    Caption = 'Sell-to Customer Name 2';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(operationDescription; Rec."Operation Description")
                {
                    Caption = 'Operation Description';
                }
                field(operationDescription2; Rec."Operation Description 2")
                {
                    Caption = 'Operation Description 2';
                }
                field("DueDate"; Rec."Due Date")
                {
                    Caption = 'Fecha Vencimiento';
                }
                field(MontoTotal; Rec.Amount)
                {
                    Caption = 'MontoTotal';
                }
                field("MontoTotalIVAINC"; Rec."Amount Including VAT")
                {
                    Caption = 'MontoTotalIVAINC';
                }
                field(ExNroTimbrado; Rec.ExNroTimbrado)
                {
                    Caption = 'NroTimbrado';

                }
                field(ExFechaInicioTimbrado; Rec.ExFechaInicioTimbrado)
                {
                    Caption = 'FechaInicioTimbrado';
                }
                field(ExFechaFinTimbrado; Rec.ExFechaFinTimbrado)
                {
                    Caption = 'FechaFinTimbrado';
                }
                field("ExternalDocumentNo"; Rec."External Document No.")
                {
                    Caption = 'ExternalDocumentNo.';

                }
                field("PostingDate"; Rec."Posting Date")
                {
                    Caption = 'Fecha registro';
                }
                field("Referencia"; Rec."Your Reference")
                {

                }
            }
        }
    }
}
