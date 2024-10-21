page 50170 ApiMovsClientes
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiMovsClientes';
    DelayedInsert = true;
    EntityName = 'ApiMovsClientes';
    EntitySetName = 'ApiMovsClientes';
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
                field("DueDate"; Rec."Due Date")
                {

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
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
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
                field(NroSerieRecibo; Rec.NroSerieRecibo)
                {

                }
                field(EnvioCorreo; Rec.EnvioCorreo)
                {

                }
                field("NroCheque"; Rec."Bill No.")
                {

                }

                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {

                }
                field(Banco; Rec.Banco)
                {

                }
                field(FechaEmisionCheque; Rec.FechaEmisionCheque)
                {

                }
                field(FechaVencimientoCheque; Rec.FechaVencimientoCheque)
                {

                }

                field(Efecto; Rec."Bill No.")
                {

                }

                field(EnvioRecibo; Rec.EnvioRecibo)
                {

                }
                field(RegularizacionRecibos; Rec.RegularizacionRecibos)
                {

                }
            }
        }
    }
}
