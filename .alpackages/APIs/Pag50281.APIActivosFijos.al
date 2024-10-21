page 50281 APIActivosFijos
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiActivosFijos';
    DelayedInsert = true;
    EntityName = 'APIActivosFijos';
    EntitySetName = 'APIActivosFijos';
    PageType = API;
    SourceTable = "Fixed Asset";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(acquired; Rec.Acquired)
                {
                    Caption = 'Acquired';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(codigoRecurso; Rec.CodigoRecurso)
                {
                    Caption = 'Codigo Recurso';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(maintenanceVendorNo; Rec."Maintenance Vendor No.")
                {
                    Caption = 'Maintenance Vendor No.';
                }
                field("FAClassCode"; Rec."FA Class Code")
                {

                }
                field("FASubclassCode"; Rec."FA Subclass Code")
                {

                }
                field(SaldoContable; Rec.SaldoContable)
                {

                }
                field(SaldoContableProvision; Rec.SaldoContableProvision)
                {

                }
                field(CostoAdquisicion; Rec.CostoAdquisicion)
                {

                }
                field(MigradoFracttal; Rec.MigradoFracttal)
                {

                }

            }
        }
    }
}
