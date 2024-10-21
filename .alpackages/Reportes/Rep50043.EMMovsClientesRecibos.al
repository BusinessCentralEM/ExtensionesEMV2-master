report 50043 EMMovsClientesRecibos
{
    ApplicationArea = All;
    Caption = 'EMMovsClientesRecibos';
    UsageCategory = Documents;
    RDLCLayout = '.\ReportsLayout\Recibo.rdl';

    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(NroSerieRecibo; NroSerieRecibo)
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(Amount; Amount)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(FormaDePago; FormaDePago)
            {

            }
            column(NombreCliente; NombreCliente)
            {

            }
            column(TELEFONO; TELEFONO)
            {

            }
            column(RUC; RUC)
            {

            }
            column(DireccionCliente; DireccionCliente)
            {

            }
            column(Correo; Correo)
            {

            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Closed by Entry No." = field("Entry No.");
                column(External_Document_No_; "External Document No.")
                {
                }
                column(Document_Type; "Document Type")
                {
                }
                column(MontoFactura; Amount)
                {
                }
                column(ImporteEnLetras; ImporteEnLetras)
                {
                }
                column(FechaEmisionFactura; "Posting Date")
                {

                }
                column(FechaVencimientoFactura; "Due Date")
                {

                }

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnPreReport()
    VAR
        Customer: Record Customer;
        MovsClientes: Record "Cust. Ledger Entry";
    BEGIN
        FormaDePago := EvaluarFormaPago(CustLedgerEntry."Payment Method Code");
        Customer.Reset();
        Customer.SetRange("No.", CustLedgerEntry."Customer No.");
        if Customer.FindSet() then begin
            NombreCliente := Customer.Name;
            RUC := Customer."VAT Registration No.";
            DireccionCliente := Customer.Address;
            TELEFONO := Customer."Phone No.";
            Correo := Customer."E-Mail";
        end;
        MovsClientes.RESET();
        MovsClientes.SetRange("Entry No.", CustLedgerEntry."Entry No.");
        if MovsClientes.FindSet() THEN BEGIN
            ImporteEnLetras := ConvertirNumeroALetras(MovsClientes.Amount)
        END;

    END;

    var
        ImporteEnLetras: Text[200];
        Unidades: array[20] of Text[10];
        Decenas: array[10] of Text[10];
        Centenas: array[10] of Text[15];
        NombreCliente: Text[200];
        DireccionCliente: Text[200];
        RUC: Text[50];
        TELEFONO: Text[70];
        Correo: Text[100];
        FormaDePago: Text[20];

    procedure EvaluarFormaPago(FormaPago: Code[10]): Text[20]
    begin
        CASE FormaPago of
            'DI':
                FormaDePago := 'Transferencia';
            'CREDCLIENT':
                FormaDePago := 'Transferencia';
            'EC':
                FormaDePago := 'Efectivo';
            'CE':
                FormaDePago := 'Efectivo';
            'DO':
                FormaDePago := 'Transferencia';
            else
                FormaDePago := 'Transferencia'

        END;

    end;

    procedure ConvertirNumeroALetras(Numero: Decimal): Text[500]
    var
        Letras: Text[500];
        ParteEntera: Integer;
        ParteDecimal: Integer;
    begin
        InicializarArrays();

        ParteEntera := Round(Numero, 1);
        ParteDecimal := (Numero * 100) mod 100;

        // Convertir billones
        if ParteEntera >= 1000000000 then
            Letras := ParteEnLetras(ParteEntera div 1000000000) + ' mil millones ';
        ParteEntera := ParteEntera mod 1000000000;

        // Convertir millones
        if ParteEntera >= 1000000 then
            Letras := Letras + ParteEnLetras(ParteEntera div 1000000) + ' millones ';
        ParteEntera := ParteEntera mod 1000000;

        // Convertir miles
        if ParteEntera >= 1000 then
            Letras := Letras + ParteEnLetras(ParteEntera div 1000) + ' mil ';
        ParteEntera := ParteEntera mod 1000;

        // Convertir centenas, decenas y unidades
        if ParteEntera > 0 then
            Letras := Letras + ParteEnLetras(ParteEntera);

        // Si hay una parte decimal, agregarla
        if ParteDecimal > 0 then
            Letras := Letras + ' con ' + Format(ParteDecimal) + '/100';

        exit(DelChr(Letras));
    end;

    procedure ParteEnLetras(Valor: Integer): Text[100]
    var
        Texto: Text[100];
    begin
        if Valor = 0 then
            exit('');

        if Valor >= 100 then
            Texto := Centenas[Valor div 100] + ' ';

        Valor := Valor mod 100;

        if Valor >= 20 then
            Texto := Texto + Decenas[Valor div 10] + ' ' + Unidades[Valor mod 10]
        else
            Texto := Texto + Unidades[Valor];

        exit(DelChr(Texto));
    end;

    procedure InicializarArrays()
    begin
        Unidades[0] := 'cero';
        Unidades[1] := 'uno';
        Unidades[2] := 'dos';
        Unidades[3] := 'tres';
        Unidades[4] := 'cuatro';
        Unidades[5] := 'cinco';
        Unidades[6] := 'seis';
        Unidades[7] := 'siete';
        Unidades[8] := 'ocho';
        Unidades[9] := 'nueve';
        Unidades[10] := 'diez';
        Unidades[11] := 'once';
        Unidades[12] := 'doce';
        Unidades[13] := 'trece';
        Unidades[14] := 'catorce';
        Unidades[15] := 'quince';
        Unidades[16] := 'dieciséis';
        Unidades[17] := 'diecisiete';
        Unidades[18] := 'dieciocho';
        Unidades[19] := 'diecinueve';

        Decenas[2] := 'veinte';
        Decenas[3] := 'treinta';
        Decenas[4] := 'cuarenta';
        Decenas[5] := 'cincuenta';
        Decenas[6] := 'sesenta';
        Decenas[7] := 'setenta';
        Decenas[8] := 'ochenta';
        Decenas[9] := 'noventa';

        Centenas[1] := 'ciento';
        Centenas[2] := 'doscientos';
        Centenas[3] := 'trescientos';
        Centenas[4] := 'cuatrocientos';
        Centenas[5] := 'quinientos';
        Centenas[6] := 'seiscientos';
        Centenas[7] := 'setecientos';
        Centenas[8] := 'ochocientos';
        Centenas[9] := 'novecientos';
    end;
}
