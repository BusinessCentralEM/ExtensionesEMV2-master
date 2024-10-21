tableextension 50051 EMFacturaVenta extends "Sales Header"
{
    fields
    {
        field(50020; Refacturacion; Boolean)
        {
            Caption = 'Refacturacion';
            DataClassification = ToBeClassified;
        }

        field(50027; FechaProvision; Date)
        {
            Caption = 'Fecha de provision';
            DataClassification = ToBeClassified;
        }
        field(50028; NumeroOC; Code[80])
        {
            Caption = 'NumeroOC';
            DataClassification = ToBeClassified;
        }
        modify(ExNroCuotas)
        {
            trigger OnBeforeValidate()
            begin
                if (ExNroCuotas < 1) then begin
                    Error('El campo número de cuota debe ser mayor o igual a 1');
                end;
            end;
        }
    }
}