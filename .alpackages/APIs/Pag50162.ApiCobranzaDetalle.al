page 50162 ApiCobranzaDetalle
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiCobranzaDetalle';
    DelayedInsert = true;
    EntityName = 'ApiCobranzaDetalle';
    EntitySetName = 'ApiCobranzaDetalle';
    PageType = API;
    SourceTable = EMCobranzas;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(fechaCobro; Rec.FechaCobro)
                {
                    Caption = 'Fecha Cobro Cliente';
                }
                field(CodCliente; Rec."Customer No")
                {
                    Caption = 'CodCliente';
                }
                field(IDDetalle; Rec.ID)
                {
                    Caption = 'IDDetalle';
                }
                field(NroFactura; Rec."External Document No")
                {
                    Caption = 'NroFactura';
                }
                field(Confirmado; Rec.Confirmado)
                {
                    Caption = 'Confirmado';
                }
                field("DocumentNo"; Rec."Document No")
                {
                    Caption = 'Document No.';
                }
            }
        }
    }
}
