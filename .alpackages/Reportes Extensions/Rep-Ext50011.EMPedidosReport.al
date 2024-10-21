reportextension 50011 EMPedidosReport extends "Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
        }
    }
}
