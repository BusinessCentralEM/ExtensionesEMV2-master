page 50133 APIOfertaCompraV4
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiOfertaCompraV4';
    DelayedInsert = true;
    EntityName = 'APIOfertaCompraV4';
    EntitySetName = 'APIOfertaCompraV4';
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
                field(CorreoEnviadoDirector; rec.CorreoEnviadoDirector)
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
        REC.SETRANGE(CorreoEnviadoDirector, FALSE);
        REC.SetRange(ActividadActual, rec.ActividadActual::"Aprobacion Nivel 3");
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
    begin
        Linea.SetFilter("Document No.", rec."No.");
        if Linea.FindSet() then begin
            repeat
                Monto += Linea."Amount Including VAT";
            until Linea.Next() = 0
        end;

    end;

    var
        Monto: Integer;
}
