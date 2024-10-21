page 50158 ApiDimensionV5
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiDimensionV5';
    DelayedInsert = true;
    EntityName = 'ApiDimensionV5';
    EntitySetName = 'ApiDimensionV5';
    PageType = API;
    SourceTable = "Dimension Value";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FrecuenciaOC; rec.FrecuenciaOC)
                {
                    Caption = 'Frecuencia OC';
                }
                field("Code"; rec.Code)
                {
                    Caption = 'Codigo';
                }
                field(Nombre; rec.Name)
                {
                    Caption = 'Nombre';
                }
                field("DimensionValueType"; rec."Dimension Value Type")
                {
                    Caption = 'Tipo Dimension';
                }
                field(ClienteAsociado; rec.ClienteAsociado)
                {
                    Caption = 'Cliente Asociado';
                }
                field(DimensionCode; rec."Dimension Code")
                {
                    Caption = 'DimensionCode';
                }
                field(UnidadNegocio; rec.EM_UnidadNegocioEMSYS)
                {
                    Caption = 'Unidad de Negocio';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {

                }


            }
        }
    }
}
