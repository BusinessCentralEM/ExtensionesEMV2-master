page 50198 APIDiarioPeriodico3
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiDiarioPeriodico3';
    DelayedInsert = true;
    EntityName = 'APIDiarioPeriodico3';
    EntitySetName = 'APIDiarioPeriodico3';
    PageType = API;
    SourceTable = "Job Journal Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Job No.';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Job Task No.';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(totalPrice; Rec."Total Price")
                {
                    Caption = 'Total Price';
                }
                field(expirationDate; Rec."Expiration Date")
                {
                    Caption = 'Expiration Date';
                }
                field(codCliente; CodCliente2)
                {
                    Caption = 'CodCliente';
                }
                field(nombreCliente; NombreCliente2)
                {
                    Caption = 'NombreCliente';
                }
                field(terminoPago; TerminoPago2)
                {
                    Caption = 'TerminoPago';
                }
                field(SystemId; rec.SystemId)
                {
                    Caption = 'SystemID';
                }
                /* field(; rec.SystemId)
                 {
                     Caption = 'SystemID';
                 }*/
                field(FechaCreacion; FechaCreacion)
                {
                }
                field("JournalBatchName"; rec."Journal Batch Name")
                {
                }

                field(NroPresupuesto; rec.NroPresupuesto)
                { }
                field(DiaFacturacion; Rec.DiaFacturacion)
                {

                }
                field(TipoPresupuesto; Rec.TipoPresupuesto)
                {

                }
                field(NroPre; Rec.NroPre)
                {

                }
                field(FechaInicioComercial; Rec.FechaCreacionFORMAT)
                {

                }
                field(Estado; Rec.Estado)
                {

                }
            }
        }
    }
    trigger OnInit()
    var
        fechafiltro: date;
    begin
        fechafiltro := Today;
        fechafiltro := calcdate('-1D', fechafiltro);
        REC.SetFilter(rec."Journal Batch Name", '<>%1', 'SINAJUSTE');
        //REC.SetFilter("Document No.", '<>%1', '001-002-150005369');
    end;

    trigger OnAfterGetRecord()
    var
        RecRef: RecordRef;
        CodClienteRef: FieldRef;
        NombreClienteRef: FieldRef;
        TerminoPagoRef: FieldRef;
        FechaCreacionRef: FieldRef;
    begin
        RecRef.Open(210);
        RecRef.GetTable(Rec);
        CodClienteRef := RecRef.Field(50011);
        RecRef.SetRecFilter();
        NombreClienteRef := RecRef.Field(50010);
        TerminoPagoRef := RecRef.Field(50012);
        FechaCreacionRef := RecRef.Field(50014);
        if RecRef.findSet() then
            CodCliente2 := CodClienteRef.Value;
        NombreCliente2 := NombreClienteRef.Value;
        TerminoPago2 := TerminoPagoRef.value;
        FechaCreacion := FechaCreacionRef.Value;
        IF NOT (rec.IsEmpty) THEN BEGIN
            FechaCreacion := DT2Date(rec.SystemCreatedAt);
        end
    end;

    var
        CodCliente2: Code[10];
        NombreCliente2: Text;
        TerminoPago2: text;
        FechaCreacion: Date;
}
