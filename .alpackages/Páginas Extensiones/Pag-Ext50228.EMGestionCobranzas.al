pageextension 50228 EMGestionCobranzas extends EMCobranzaCabecera
{
    layout
    {
        addafter(Horario)
        {
            field("Factura física"; Rec."Factura física")
            {
                ApplicationArea = ALL;
                Caption = 'Factura física';


            }
        }
        addafter(MontoPendiente)
        {

            field("Monto Confirmado"; Rec."Monto Confirmado")
            {
                ApplicationArea = all;
                Caption = 'Monto Confirmado';
            }
        }
    }
    actions
    {
        addafter(Nuevo)
        {
            action("Historico")
            {
                ApplicationArea = Suite;
                Caption = 'Movs Cliente';
                Image = CustomerLedger;
                RunObject = Page "Customer Ledger Entries";
                RunPageLink = "Customer No." = FIELD("Customer No"), "Document Type" = FILTER(Invoice);
                RunPageView = SORTING("Document Type", "Posting Date") order(descending);
                Scope = Page;
                PromotedCategory = Process;
                Promoted = true;
            }
            action("Comentarios")
            {
                ApplicationArea = Suite;
                Caption = 'Comentarios';
                Image = ViewComments;
                RunObject = Page "EMComentariosCobranzas";
                PromotedCategory = Process;
                RunPageLink = "No." = FIELD("Customer No");
                //"Document Line No." = CONST(0);
                Promoted = true;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Customer: record Customer;
        EnvioFactFisica: Boolean;
        NombreEjecutivo: Text[50];
        Dimension: Record "Dimension Value";
        UnidadNegocio: Text[50];

    begin
        customer.Reset();
        customer.SetRange("No.", REC."Customer No");
        if Customer.FindSet() then begin
            EnvioFactFisica := Customer.EntregaFisicaFactura;
            NombreEjecutivo := BuscarEjecutivo(Customer."Salesperson Code");
        end;

        rec."Factura física" := EnvioFactFisica;
        rec.Ejecutivo := NombreEjecutivo;

        Dimension.Reset();
        Dimension.SetRange(ClienteAsociado, rec."Customer No");
        Dimension.SetRange("Dimension Code", 'PS');
        if Dimension.FindFirst() then
            UnidadNegocio := BuscarUnidadNegocio(Dimension.EM_UnidadNegocioEMSYS);
        Rec.UnidadNegocio := UnidadNegocio;
        // UnidadNegocio:= Dimension.Name;




    end;

    procedure BuscarEjecutivo(CodEjecutivo: Code[20]): text[50]
    var
        Ejecutivos: record "Salesperson/Purchaser";
    begin
        Ejecutivos.Reset();
        Ejecutivos.SetRange(Code, CodEjecutivo);
        if Ejecutivos.FindSet() then
            exit(Ejecutivos.Name)
        else
            exit('')

    end;

    procedure BuscarUnidadNegocio(CodUnidad: Code[2]): Text[30]
    var
        Dimension: Record "Dimension Value";
    begin
        dimension.Reset();
        Dimension.SetRange("Dimension Code", 'UN');
        Dimension.SetRange(Code, CodUnidad);
        if Dimension.FindSet() then
            exit(Dimension.Name)
    end;
}