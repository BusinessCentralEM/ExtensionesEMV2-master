page 50161 ApiComentariosCobranza
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiComentariosCobranza';
    DelayedInsert = true;
    EntityName = 'ApiComentariosCobranza';
    EntitySetName = 'ApiComentariosCobranza';
    PageType = API;
    SourceTable = "Sales Comment Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(medioContacto; Rec.MedioContacto)
                {
                    Caption = 'Medio Contacto';
                }
                field(migrado; Rec.Migrado)
                {
                    Caption = 'Migrado';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(resultadoContacto; Rec.ResultadoContacto)
                {
                    Caption = 'Resultado Contacto';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(Comentario; Rec.Comentario)
                {
                    Caption = 'Comentario';
                }
                field("Personacontactada"; Rec."Persona contactada")
                {
                    Caption = 'Contacto';
                }
            }
        }
    }
}
