page 50166 APIEMDimensiones
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiemDimensiones';
    DelayedInsert = true;
    EntityName = 'APIEMDimensiones';
    EntitySetName = 'APIEMDimensiones';
    PageType = API;
    SourceTable = "Dimension Value";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(clienteAsociado; Rec.ClienteAsociado)
                {
                    Caption = 'ClienteAsociado';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(comentarioProyecto; Rec.ComentarioProyecto)
                {
                    Caption = 'ComentarioProyecto';
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                }
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                }
                field(dimensionId; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                }
                field(dimensionValueID; Rec."Dimension Value ID")
                {
                    Caption = 'Dimension Value ID';
                }
                field(dimensionValueType; Rec."Dimension Value Type")
                {
                    Caption = 'Dimension Value Type';
                }
                field(emUnidadNegocioEMSYS; Rec.EM_UnidadNegocioEMSYS)
                {
                    Caption = 'UN Punto de Servicio';
                }
                field(frecuenciaOC; Rec.FrecuenciaOC)
                {
                    Caption = 'FrecuenciaOC';
                }
                field(globalDimensionNo; Rec."Global Dimension No.")
                {
                    Caption = 'Global Dimension No.';
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(mapToICDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                }
                field(mapToICDimensionValueCode; Rec."Map-to IC Dimension Value Code")
                {
                    Caption = 'Map-to IC Dimension Value Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(seccionDiarioPeriodico; Rec.SeccionDiarioPeriodico)
                {
                    Caption = 'SeccionDiarioPeriodico';
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
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                }
            }
        }
    }
}
