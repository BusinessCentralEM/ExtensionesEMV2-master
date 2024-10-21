report 50037 EM_OrdenPagoHistorico
{
    ApplicationArea = All;
    Caption = 'EM_OrdenPagoHistorico';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = '.\ReportsLayout\EM_OrdenPagoHist.rdl';
    dataset
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Document No.";
            column(PostingDate; "Posting Date")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(External_Document_No_; "External Document No.")
            {
            }
            column(Amount; "Amount (LCY)")
            {
            }
            column(Vendor_Name; "Vendor Name")
            {
            }
            column(Banco; "Bal. Account No.")
            {
            }
            dataiteM("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Closed by Entry No." = field("Entry No.");

                column(FacturaProveedor; "Document No.")
                {

                }
                column("MontoTotalFactura"; Amount)
                {

                }
                column(MontoPendiente; "Remaining Amount")
                {

                }
                column(Descripcion; Description)
                {

                }

                column(Due_Date; "Due Date")
                {

                }

            }

        }
    }


    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        Filtro := VendorLedgerEntry.GetFilters()
    end;

    var
        Filtro: text[100];
}
