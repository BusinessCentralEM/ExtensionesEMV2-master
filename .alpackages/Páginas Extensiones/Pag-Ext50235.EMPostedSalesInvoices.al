pageextension 50235 EMPostedSalesInvoices extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Remaining Amount")
        {
            field(Refacturacion; Rec.Refacturacion)
            {
                Width = 20;
                ApplicationArea = all;
            }
        }
    }
}
