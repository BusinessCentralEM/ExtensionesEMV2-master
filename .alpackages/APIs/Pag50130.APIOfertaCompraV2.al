page 50146 APIOfertaCompraV2
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiOfertaCompraV2';
    DelayedInsert = true;
    EntityName = 'APIOfertaCompraV2';
    EntitySetName = 'APIOfertaCompraV2';
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
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(IDAprobador; Rec.IDAprobador)
                {
                    Caption = 'ID APROBADOR';
                }
                field(ActividadActual; Rec.ActividadActual)
                {
                    Caption = 'Actividad Actual';
                }
                field(CorreoEnviado; rec.CorreoEnviado)
                {
                    Caption = 'CorreoEnviadoJefe';

                }
                field(CorreoEnviadoGerente; rec.CorreoEnviadoGerente)
                {
                    Caption = 'CorreoEnviadoGerente';

                }
                field(CorreoEnviadoDirector; rec.CorreoEnviadoDirector)
                {
                    Caption = 'CorreoEnviadoDirector';

                }
                field(Pausadp; rec.Pausadp)
                {
                    Caption = 'Pausado';

                }

                field(FechaAprobacionGcia; rec.FechaAprobacionGcia)
                {
                    Caption = 'FechaAprobacionGcia';

                }
                field("CodProveedor"; Rec."Buy-from Vendor No.")
                {

                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {

                }

            }
        }
    }
    trigger OnInit()
    var
        fechafiltro: date;

    begin

        /*fechafiltro := Today;
        fechafiltro := calcdate('-1D', fechafiltro);
        REC.SETFILTER(rec.SystemModifiedAt, '>%1', CreateDateTime(fechafiltro, 000000T));*/
        REC.SetRange(Pausadp, false);
    end;
}
