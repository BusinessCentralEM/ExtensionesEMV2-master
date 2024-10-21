report 50039 EMOrdenPagoMovContable
{
    ApplicationArea = All;
    Caption = 'EMOrdenPagoMovContable';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = '.\ReportsLayout\EM_OrdenPagoMovContable.rdl';
    dataset
    {
        dataitem(GLEntry; "G/L Entry")
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
            column(Amount; "Amount")
            {
            }
            column(Bal__Account_No_; "Bal. Account No.")
            {

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
}
