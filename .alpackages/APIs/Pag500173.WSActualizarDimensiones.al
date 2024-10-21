page 50173 WSActualizarDimensiones
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'wsActualizarDimensiones';
    DelayedInsert = true;
    EntityName = 'WSActualizarDimensiones';
    EntitySetName = 'WSActualizarDimensiones';
    PageType = API;
    SourceTable = Resource;
    Permissions = tabledata Resource = RIMD, tabledata "Fixed Asset" = RIMD;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(CodActFijo; Rec.CodActFijo)
                {

                }
                field("No"; Rec."No.")
                {

                }
            }

        }
    }
    [ServiceEnabled]

    procedure ActualizarDimensionesWS(CodActivo: Code[20])
    var
        ActDimensiones: Codeunit "EMActualizarDimensiones";
        actionContext: WebServiceActionContext;
    begin
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::WSActualizarDimensiones);
        actionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        ActDimensiones.ActualizarDimensiones(CodActivo);
        actionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;
}
