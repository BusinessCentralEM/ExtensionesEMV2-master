pageextension 50255 PurchInvoiceSubform extends "Purch. Invoice Subform"
{
    layout
    {
        addafter(IVALine)
        {
            field("VAT Prod. Posting Group2"; Rec."VAT Prod. Posting Group")
            {
                Caption = 'Grupo Contable Producto';
                ApplicationArea = all;

            }
        }
    }
}
