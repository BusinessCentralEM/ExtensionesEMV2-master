page 50200 EMComentariosCobranzas
{
    AutoSplitKey = true;
    Caption = 'Comentarios Cobranzas';
    DataCaptionFields = "No.", NombreCliente;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = EMComentariosCobranzasLineas;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                ShowCaption = false;
                field(Fecha; Rec.Fecha)
                {
                    ApplicationArea = Comments;
                }
                field(Comentario; Rec.Comentario)
                {
                    ApplicationArea = Comments;

                }
                field(NroLinea; Rec.NroLinea)
                {
                    ApplicationArea = Comments;
                    Visible = false;
                }
                field("Usuario Autor"; Rec."Usuario Autor")
                {
                    ApplicationArea = Comments;
                }

            }
        }
    }
    trigger OnOpenPage()
    var
        GestionCobranzas: record EMCobranzaCabecera;
    begin
        GestionCobranzas.Reset();
        GestionCobranzas.SetRange("Customer No", REC."No.");
        if GestionCobranzas.FindSet() then
            Nombre := GestionCobranzas."Customer Name"

    end;

    var
        Nombre: Text[50];
}
