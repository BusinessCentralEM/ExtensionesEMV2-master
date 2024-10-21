

codeunit 50081 EMSuscEventMovsClientes
{
    Permissions = tabledata "Cust. Ledger Entry" = RIMD;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', true, true)]


    local procedure OnBeforeCustLedgEntryInsert(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; var NextEntryNo: Integer)
    begin
        CustLedgerEntry.EnvioCorreo := GenJournalLine.EnvioCorreo;
        CustLedgerEntry.Banco := GenJournalLine.Banco;
        CustLedgerEntry.FechaEmisionCheque := GenJournalLine.FechaEmisionCheque;
        CustLedgerEntry.FechaVencimientoCheque := GenJournalLine.FechaVencimientoCheque;
        CustLedgerEntry.EnvioRecibo := GenJournalLine.EnvioRecibo;
        CustLedgerEntry.RegularizacionRecibos := GenJournalLine.RegularizacionRecibos;
    end;
}

