query 50017 QueryApiDiarioPerProy
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    EntityName = 'QueryApiDiarioPerProy';
    EntitySetName = 'QueryApiDiarioPerProy';
    QueryType = API;

    elements
    {
        dataitem(jobJournalLine; "Job Journal Line")
        {
            DataItemTableFilter = "Expiration Date" = filter(0D), "Journal Batch Name" = filter('MANT' | 'MO' | 'ESPECIALIS');
            column(systemId; SystemId)
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(totalPrice; "Total Price")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(nombreCliente; NombreCliente)
            {
            }
            column(nroPresupuesto; NroPresupuesto)
            {
            }
            column(description; Description)
            {
            }
            column(codCliente; CodCliente)
            {
            }
            column(No_; "No.")
            {

            }
            column(Line_Amount; "Line Amount")
            {

            }

            dataitem(Clientes; Customer)
            {
                DataItemLink = "No." = jobJournalLine.CodCliente;
                SqlJoinType = InnerJoin;
                DataItemTableFilter = ExReqOC = filter(true);
                column(RUC; "VAT Registration No.")
                {
                }




            }
        }
    }





}
