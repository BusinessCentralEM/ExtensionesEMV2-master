page 50197 ApiLogCambioControlFactVaria
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiLogCambioControlFactVaria';
    DelayedInsert = true;
    EntityName = 'ApiLogCambioControlFactVaria';
    EntitySetName = 'ApiLogCambioControlFactVaria';
    PageType = API;
    SourceTable = "Change Log Entry";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(tableCaption; Rec."Table Caption")
                {
                    Caption = 'Table Caption';
                }
                field(tableNo; Rec."Table No.")
                {
                    Caption = 'Table No.';
                }
                field(fieldNo; Rec."Field No.")
                {
                    Caption = 'Field No.';
                }
                field(fieldCaption; Rec."Field Caption")
                {
                    Caption = 'Field Caption';
                }
                field(typeOfChange; Rec."Type of Change")
                {
                    Caption = 'Type of Change';
                }
                field(oldValue; Rec."Old Value")
                {
                    Caption = 'Old Value';
                }
                field(ValorAnteriorTexto; ValorAnteriorTexto)
                {

                }
                field(newValue; Rec."New Value")
                {
                    Caption = 'New Value';
                }
                field(ValorNuevoTexto; ValorNuevoTexto)
                {

                }
                field(userID; Rec."User ID")
                {
                    Caption = 'User ID';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(dateAndTime; Rec."Date and Time")
                {
                    Caption = 'Date and Time';
                }
                /* field(IDFORMAT; IDFORMAT)
                 {

                 }*/
                field(Proyecto; Proyecto)
                {

                }
                field(TareaProyecto; TareaProyecto)
                {

                }
                field(CodCliente; CodCliente)
                {

                }
                field(NombreCliente; NombreCliente)
                {

                }
                field(Item; Item)
                {

                }
                field(descripcion; descripcion)
                {

                }
                field(Puesto; Puesto)
                {

                }
                field(Sector; Sector)
                {

                }
                field(PrecioUnitario; PrecioUnitario)
                {

                }
                field(UnidadNegocio; UnidadNegocio)
                {


                }

                field(ID; ID)
                {

                }
                field(Tipo; Tipo)
                {

                }
            }
        }
    }
    trigger OnInit()
    begin
        // REC.Reset();
        REC.setrange("Table No.", 50025);
        REC.SetRange("Field No.", 8);
        rec.SetRange("Old Value", '2');
        rec.SetRange("New Value", '3');


    end;

    trigger OnAfterGetRecord()
    var
        LogCambio: Record "Change Log Entry";
        ControlFacturacion: Record EM_ControlFacturacion;
    begin

        BEGIN
            ControlFacturacion.Reset();
            ControlFacturacion.SetRange(Tipo, 1);
            //Evaluate(IDFORMAT, rec."Primary Key Field 1 Value");
            ControlFacturacion.SetFilter(Id, REC."Primary Key Field 1 Value");
            if ControlFacturacion.FindSet() then begin
                Proyecto := ControlFacturacion.Proyecto;
                TareaProyecto := ControlFacturacion.TareaProyecto;
                CodCliente := ControlFacturacion.CodCliente;
                NombreCliente := ControlFacturacion.NombreCliente;
                Item := ControlFacturacion.Item;
                descripcion := ControlFacturacion.Descripcion;
                Puesto := ControlFacturacion.Puesto;
                Sector := ControlFacturacion.Sector;
                PrecioUnitario := ControlFacturacion.PrecioUnitario;
                ID := ControlFacturacion.Id;
                UnidadNegocio := ControlFacturacion.UnidadNegocio;
                Tipo := Format(ControlFacturacion.Tipo);
                if rec."New Value" = '3' then begin
                    ValorNuevoTexto := 'A Facturar'
                end;
                if rec."Old value" = '2' then begin
                    ValorAnteriorTexto := 'Confirmacion Cliente'
                end;



            end;
        END;


    end;

    var
        IDFORMAT: Integer;
        Proyecto: Code[20];
        TareaProyecto: Code[50];
        CodCliente: code[20];
        NombreCliente: Text[100];
        Item: code[20];
        descripcion: Text[100];
        Puesto: Text[100];
        Sector: Text[100];
        PrecioUnitario: Decimal;
        UnidadNegocio: Code[30];
        ID: Integer;
        Tipo: Text[50];
        ValorAnteriorTexto: Text[50];
        ValorNuevoTexto: Text[50];
}
