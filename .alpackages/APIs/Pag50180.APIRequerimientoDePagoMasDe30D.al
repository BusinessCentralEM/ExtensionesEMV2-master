page 50180 APIRequerimientoDePagoMasDe30D
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'APIRequerimientoDePagoMasDe30D';
    DelayedInsert = true;
    EntityName = 'APIRequerimientoDePagoMasDe30D';
    EntitySetName = 'APIRequerimientoDePagoMasDe30D';
    PageType = API;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field("ClosedbyEntryNo"; Rec."Closed by Entry No.")
                {
                    Caption = 'ClosedbyEntryNo';
                }
                field(SystemId; Rec.SystemId)
                {

                }
                field(UltimoCorreoEnviadoFecha; Rec.UltimoCorreoEnviadoFecha)
                {

                }
                field("FechaVencimiento"; Rec."Due Date")
                {

                }
                FIELD(Abierto; Rec.Open)
                {

                }
                field("CustomerPostingGroup"; Rec."Customer Posting Group")
                {

                }
                field("RemainingAmount"; Rec."Remaining Amount")
                {

                }

            }
        }
    }
    /* trigger OnInit()
     var
         fechafiltro: date;

     begin
         fechafiltro := today;
         fechafiltro := calcdate('-15D', fechafiltro);
         //REC.SetFilter("Posting Date", '>%1', fechafiltro);
         //rec.SetRange("Due Date", 20231201D, 20240306D);
         REC.SetFilter("Due Date", '>=%1', fechafiltro);
     end;*/
}
