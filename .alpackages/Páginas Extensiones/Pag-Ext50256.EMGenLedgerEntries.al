pageextension 50256 EMGenLedgerEntries extends "General Ledger Entries"
{
    actions
    {
        addafter(ReverseTransaction)
        {
            action(OrdenPago)
            {
                ApplicationArea = ALL;
                Caption = 'Reporte Orden Pago Historico';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Report;


                trigger OnAction()
                var
                    ReporteOrdenPagoHist: Report EM_OrdenPagoHistorico;
                    GLEntry: record "G/L Entry";

                begin

                    GLEntry.RESET;
                    //GenJnlLine.COPY(Rec);
                    GLEntry.SETRANGE("Document No.", Rec."Document No.");
                    GLEntry.SETRANGE("G/L Account No.", Rec."G/L Account No.");
                    IF GLEntry.FINDSET THEN
                        REPORT.RUN(REPORT::EMOrdenPagoMovContable, TRUE, TRUE, GLEntry);
                end;
            }
        }
    }

}
