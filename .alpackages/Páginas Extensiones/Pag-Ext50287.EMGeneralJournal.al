pageextension 50287 EMGeneralJournal extends "General Journal"
{
    layout
    {
        addafter("Posting Date")
        {
            field(FechaVencimientoCheque; Rec.FechaVencimientoCheque)
            {
                Caption = 'Fecha Vencimiento Cheque';
                ApplicationArea = all;
            }
        }
    }
}
