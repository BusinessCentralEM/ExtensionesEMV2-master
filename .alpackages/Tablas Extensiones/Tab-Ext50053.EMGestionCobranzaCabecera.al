tableextension 50053 EMGestionCobranzaCabecera extends EMCobranzaCabecera
{
    fields
    {
        field(50000; "Factura física"; Boolean)
        {
            Caption = 'Factura física';
            DataClassification = ToBeClassified;
        }
        field(50001; "Monto Confirmado"; Decimal)
        {
            Caption = 'Monto Confirmado';
            FieldClass = FlowField;
            TableRelation = EMCobranzas;
            CalcFormula = sum(EMCobranzas.ImportePendiente2 where("Customer No" = field("Customer No"), Confirmado = const(true), Status = filter(0 .. 3 | 6)));
        }

    }
}

