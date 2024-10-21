pageextension 50240 EMEmployeeLedgerEntries extends "Detailed Empl. Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field(Desliquidado; Rec.Unapplied)
            {
                ApplicationArea = all;

            }
        }
    }
}
