query 50019 EMTrasnferProductos
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    EntityName = 'QueryEMTrasnferProductos';
    EntitySetName = 'QueryEMTrasnferProductos';
    QueryType = API;
    Permissions = tabledata "Transfer Receipt Header" = r,
    tabledata "Transfer Receipt Line" = r;
    elements
    {
        dataitem(TransferReceiptHeader; "Transfer Receipt Header")
        {
            column(No; "No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(TransferOrderNo; "Transfer Order No.")
            {
            }
            column(TransfertoCode; "Transfer-to Code")
            {
            }
            column(TransferfromCode; "Transfer-from Code")
            {
            }
            column(TransferfromName; "Transfer-from Name")
            {
            }
            column(TransfertoName; "Transfer-to Name")
            {
            }
            column(TransferOrderDate; "Transfer Order Date")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(ShipmentDate; "Shipment Date")
            {
            }
            column(InTransitCode; "In-Transit Code")
            {
            }
            column(Transaction_Type; "Transaction Type")
            {

            }

            dataitem(Transfer_Receipt_Line; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = TransferReceiptHeader."No.";
                SqlJoinType = InnerJoin;
                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }

                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Item_Category_Code; "Item Category Code")
                {

                }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                {

                }
                column(Inventory_Posting_Group; "Inventory Posting Group")
                {

                }
                column(Item_Rcpt__Entry_No_; "Item Rcpt. Entry No.")
                {

                }
                column(SystemId; SystemId)
                {

                }


            }
        }
    }

}
