page 50181 ApiMovsClientes3M
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiMovsClientes3M';
    DelayedInsert = true;
    EntityName = 'ApiMovsClientes3M';
    EntitySetName = 'ApiMovsClientes3M';
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
            }
        }
    }
    trigger OnInit()
    var
        fechafiltroDesde: date;
        FechaFiltroHasta: date;
        TresMeses: date;

    begin
        fechafiltroDesde := 20240101D;
        FechaFiltroHasta := 20240430D;
        // TresMeses := calcdate('-3M', fechafiltro);
        //REC.SetFilter("Posting Date", '>%1', fechafiltro);
        rec.SetRange("Posting Date", FechaFiltroDesde, FechaFiltroHasta);
        rec.SetRange("Document Type", rec."Document Type"::Payment);
        rec.setrange("Customer Posting Group", 'FINAL')
        // REC.SetFilter("Due Date", '>=%1', fechafiltro);
    end;
}
