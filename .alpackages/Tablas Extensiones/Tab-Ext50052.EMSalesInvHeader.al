tableextension 50052 EMSalesInvHeader extends "Sales Invoice Header"
{

    fields
    {
        field(50018; Refacturacion; Boolean)
        {
            Caption = 'Refacturacion';
            DataClassification = ToBeClassified;
        }
    }
}
