page 50008 APIClientes
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiClientes';
    DelayedInsert = true;
    EntityName = 'EMClientes';
    EntitySetName = 'EMClientes';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TipoIdent; TipoIdent)
                {
                    ApplicationArea = all;
                }
                field(FechaFacturacion; Rec.FechaFacturacion)
                {
                    ApplicationArea = all;
                }
                field(DiaFacturacion; Rec.DiaFacturacion)
                {
                    ApplicationArea = all;
                }
                field(Sextorizado; Rec.Sextorizado)
                {
                    ApplicationArea = all;
                }
                field(ruc; Rec."VAT Registration No.")
                {
                    ApplicationArea = all;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = all;
                }
                field("EMail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field(ExReqOC; Rec.ExReqOC)
                {
                    ApplicationArea = ALL;
                }
                field(NotiicarCliente; Rec.NotiicarCliente)
                {
                    ApplicationArea = All;
                }
                field(Direccion; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field(Telefono; Rec."Mobile Phone No.")
                {
                    ApplicationArea = all;
                }
                field(CorreoCobranzas; Rec.CorreoCobranzas)
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                FIELD(CorreoRecibo; Rec.CorreoRecibo)
                {

                }


            }
        }
    }
    trigger OnAfterGetRecord()
    var
        RecRef: RecordRef;
        TipoIdentificacion: FieldRef;
        NombreClienteRef: FieldRef;
        TerminoPagoRef: FieldRef;
        FechaCreacionRef: FieldRef;


    begin

        RecRef.Open(18);
        RecRef.GetTable(Rec);
        TipoIdentificacion := RecRef.Field(50004);
        RecRef.SetRecFilter();

        if RecRef.findSet() then
            TipoIdent := TipoIdentificacion.Value;
    end;

    var
        TipoIdent: text[20];
}
