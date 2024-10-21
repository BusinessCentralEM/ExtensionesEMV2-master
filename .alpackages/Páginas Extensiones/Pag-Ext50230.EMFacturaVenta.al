pageextension 50230 EMFacturaVenta extends "Sales Invoice"
{
    layout
    {
        addafter("Posting Description")
        {
            field(Refacturacion; Rec.Refacturacion)
            {
                ApplicationArea = ALL;
                Caption = '¿Es refacturación?';
            }
        }
    }
    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                RefacturacionCopy: Codeunit EMRefacturacionMigracion;
            begin
                RefacturacionCopy.Run(rec);
                if (rec.ExNroCuotas < 1) and (rec."Customer Posting Group" = 'FUNCIONARIO') then begin
                    Error('El campo Nro Cuotas debe ser mayor a 0');
                end
            end;
        }
    }
}