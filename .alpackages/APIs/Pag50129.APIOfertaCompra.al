page 50147 APIOfertaCompra
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    Caption = 'APIOfertaCompra';
    DelayedInsert = true;
    EntityName = 'APIOfertaCompra';
    EntitySetName = 'APIOfertaCompra';
    PageType = API;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(buyFromContactNo; Rec."Buy-from Contact No.")
                {
                    Caption = 'Buy-from Contact No.';
                }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")
                {
                    Caption = 'Buy-from Vendor Name';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }

                field(ActividadActual; Rec.ActividadActual)
                {
                    Caption = 'Actividad';

                }
                field(IdAprobador; rec.IdAprobador)
                {
                    Caption = 'SystemId';

                }
                field(Monto; Monto)
                {
                    Caption = 'Monto';

                }
                field(CorreoEnviado; rec.CorreoEnviado)
                {
                    Caption = 'Aprobado';

                }

                field(SystemId; rec.SystemId)
                {
                    Caption = 'SystemId';

                }

            }
        }
    }
    trigger OnInit()
    var
        fechafiltro: date;

    begin

        fechafiltro := Today;
        fechafiltro := calcdate('-1D', fechafiltro);
        REC.SETFILTER(rec.SystemModifiedAt, '>%1', CreateDateTime(fechafiltro, 000000T));
        REC.SETRANGE(CorreoEnviado, FALSE);
        REC.SetRange(ActividadActual, rec.ActividadActual::"Aprobacion Jefe");
        IF NOT (rec.IsEmpty) THEN BEGIN
            REC.SetCurrentKey(SystemModifiedAt);
            REC.SetAscending(SystemModifiedAt, true);
            rec.FindLast();
            rec.SetFilter(SystemId, rec.SystemId);
        END
    end;

    trigger OnAfterGetRecord()
    var
        Linea: Record "Purchase Line";
        Empleados: Record Employee;
    begin
        Linea.SetFilter("Document No.", rec."No.");
        if Linea.FindSet() then begin
            repeat
                Monto += Linea."Amount Including VAT";
            until Linea.Next() = 0
        end;
        Empleados.Reset();
        Empleados.SetRange(Name, Rec.Empleado);
        if Empleados.findset then
            Jefe := Empleados.EMJefe;
        CorreoJefe := BuscarCorreoJefe(Jefe);


    end;

    procedure BuscarCorreoJefe(NombreJefe: Text[70]): Text
    var
        Empleados: Record Employee;

    begin
        Empleados.reset();
        Empleados.SetRange(Name, NombreJefe);
        if Empleados.findset then
            CorreoJefe := Empleados."Company E-Mail";
        exit(CorreoJefe)
    end;


    var
        Monto: Integer;
        Jefe: text[70];
        CorreoJefe: Text[30];
}
