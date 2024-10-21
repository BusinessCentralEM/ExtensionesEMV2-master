page 50145 APIDiarioProyecto2
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiDiarioProyecto2';
    DelayedInsert = true;
    EntityName = 'APIDiarioProyecto2';
    EntitySetName = 'APIDiarioProyecto2';
    PageType = API;
    SourceTable = "Job Journal Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(totalPrice; Rec."Total Price")
                {
                    Caption = 'Total Price';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Job Task No.';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'NroProyecto';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Dimension';
                }
                field(NombreCliente; Rec.NombreCliente)
                {
                    Caption = 'NombreCliente';
                }
                field(NroPresupuesto; Rec.NroPresupuesto)
                {
                    Caption = 'NroPresupuesto';
                }

                field(Description; Rec.Description)
                {
                    Caption = 'Descripcion';
                }
                field(CodCliente; CodCliente)
                {
                    Caption = 'CodCliente';
                }

                field(RUC; RUC)
                {
                    Caption = 'RUC';
                }
                field(Migrado; rec.Migrado)
                {
                    Caption = 'Migrado';
                }

                field("FechaCaducidad"; rec."Expiration Date")
                {
                    Caption = 'FechaCaducidad';
                }
                field("Nro"; rec."No.")
                {
                    Caption = 'No';
                }
                field(NroPres; rec.NroPresupuesto)
                {
                    Caption = 'NroPresupuesto';
                }
                field("NombreTemplate"; Rec."Journal Template Name")
                {

                }
                field("NombreSeccion"; Rec."Journal Batch Name")
                {

                }
                field("LineaNo"; Rec."Line No.")
                {

                }
                field("BalticModificado"; Rec."Baltic Modificado")
                {

                }
                field(NroPre; Rec.NroPre)
                {

                }
                field(TipoPresupuesto; Rec.TipoPresupuesto)
                {

                }
                field(BalticReemplazado; Rec.BalticReemplazado)
                {

                }
                field("RecurringFrequency"; Rec."Recurring Frequency")
                {


                }
                field(Sector; Rec.Sector)
                {

                }
                field(Puesto; Rec.Puesto)
                {

                }

            }

        }
    }
    /* trigger OnInit()
     VAR
         Clientes: Record Customer;
     BEGIN
         Clientes.Reset();
         Clientes.SetRange(ExReqOC, true);
         if Clientes.FindSet() then begin
             rec.SetRange(CodCliente, Clientes."No.");
         end;


     END;
 */
    TRIGGER OnInit()
    begin
        REC.SetFilter(rec."Journal Batch Name", '<>%1', 'SINAJUSTE');
    end;


    trigger OnAfterGetRecord()
    var
        Clientes: Record Customer;

    BEGIN

        Clientes.Reset();
        Clientes.SetRange("No.", rec.CodCliente);
        Clientes.SetRange(ExReqOC, true);
        IF Clientes.FindSet() then begin

            RUC := Clientes."VAT Registration No.";
            CodCliente := Clientes."No.";
            rec.SetRange(CodCliente, Clientes."No.");


        end else
            rec.Next()


    END;

    var
        RUC: Code[30];
        CodCliente: Code[50];
}
