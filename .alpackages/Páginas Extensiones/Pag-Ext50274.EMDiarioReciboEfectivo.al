pageextension 50274 EMDiarioReciboEfectivo extends "Cash Receipt Journal"
{

    layout
    {
        addbefore("Posting Date")
        {
            field(EnvioRecibo; Rec.EnvioRecibo)
            {
                Caption = 'Enviar Recibo';
                ApplicationArea = all;
            }
            field(RegularizacionRecibos; Rec.RegularizacionRecibos)
            {
                Caption = 'Regularizacion de recibos';
                ApplicationArea = All;
            }

        }
        addafter("Bill No.")
        {
            field(Banco; Rec.Banco)
            {
                Caption = 'Banco';
                ApplicationArea = all;
            }
            field(FechaEmisionCheque; Rec.FechaEmisionCheque)
            {
                Caption = 'Fecha Emision Cheque';
                ApplicationArea = all;
            }
            field(FechaVencimientoCheque; Rec.FechaVencimientoCheque)
            {
                Caption = 'Fecha Vencimiento Cheque';
                ApplicationArea = all;

            }
        }



    }


    /*  trigger OnNewRecord(BelowxRec: Boolean)
      var
          Serie: record "No. Series Line";
          UltimoNroSerie: Code[20];
          NroSerie: Code[20];
      begin
          if rec."Document Type" = rec."Document Type"::Payment THEN BEGIN
              serie.Reset();
              serie.Setrange("Series Code", 'RECIBO SERIES');
              if serie.FindSet() then begin
                  UltimoNroSerie := Serie."Last No. Used";
                  NroSerie := NroSerieMasUno(UltimoNroSerie);
                  rec."Document No." := NroSerie;
                  rec.Modify();
              end;
          END;


      end;

      procedure NroSerieMasUno(UltimoNroSerie: Code[20]): Code[20]
      var
          Resultado: integer;
      begin
          Evaluate(Resultado, UltimoNroSerie);
          Resultado := Resultado + 1;
          // Evaluate(UltimoNroSerie)
          exit(Format(Resultado))

      end;*/

    /*actions
    {

        modify("Apply Entries")
        {

            trigger OnBeforeAction()
            var
                // Respuesta: Boolean;
                // Pregunta: Text;
                // Texto: Label 'Se asignaran los numeros de serie automaticamente a las lineas que tengan el valor "Sí" en enviar recibo, desea continuar?';

                Serie: record "No. Series Line";
                UltimoNroSerie: Code[20];
                NroSerie: Code[20];
                DiarioRecibo: record "Gen. Journal Line";


            begin

                Message('Hola');
                if REC.EnvioRecibo = ENUMEnvioRecibo::"1"
                then begin
                    serie.Reset();
                    serie.Setrange("Series Code", 'RECIBO SERIES');
                    if serie.FindSet() then begin
                        UltimoNroSerie := Serie."Last No. Used";
                        NroSerie := NroSerieMasUno(UltimoNroSerie);
                        REC."Document No." := NroSerie;
                        //Message(NroSerie);
                        REC.Modify();
                        serie."Last No. Used" := IncStr(serie."Last No. Used");
                        serie.Modify();
                    end;
                END
                else
                    Clear(REC."Document No.");

                DiarioRecibo.Reset();
                DiarioRecibo.SetRange("Journal Template Name", rec."Journal Template Name");
                DiarioRecibo.SetRange("Document No.", '');
                if DiarioRecibo.FindSet() then begin
                    repeat

                        if (DiarioRecibo.EnvioRecibo = ENUMEnvioRecibo::"0") or (DiarioRecibo.EnvioRecibo = ENUMEnvioRecibo::"2")
                        then begin
                            Error('Debe ingresar un numero de documento para las lineas que no enviará el recibo digital');
                        END
                    until DiarioRecibo.next = 0;

                end;


            end;




        
    }*/
    /*trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Serie: record "No. Series Line";
        UltimoNroSerie: Code[20];
        NroSerie: Code[20];
    begin
        if rec.EnvioRecibo = rec.EnvioRecibo::"1" THEN BEGIN
            serie.Reset();
            serie.Setrange("Series Code", 'RECIBO SERIES');
            if serie.FindSet() then begin
                UltimoNroSerie := Serie."Last No. Used";
                NroSerie := NroSerieMasUno(UltimoNroSerie);
                rec."Document No." := NroSerie;
                rec.Modify();
                serie."Last No. Used" := IncStr(serie."Last No. Used");
                serie.Modify();
            end;
        END
        else
            //IF ((REC.EnvioRecibo = rec.EnvioRecibo::"2") or (rec.EnvioRecibo = rec.EnvioRecibo::"0")) and (rec."Document No." = '0')
           // then
                Clear(rec."Document No.");


    end;  
*/

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        LineaAnterior: Integer;
        NroDocumento: code[50];
    begin
        //  Message('Hola');
        rec."Document No." := '00-1';
        LineaAnterior := LineaAnterior(rec."Document No.");
        NroDocumento := NroDocumentoLineaAnterior(LineaAnterior);
        rec."Document No." := NroDocumento;
        /*if rec."Account Type" = REC."Account Type"::"Bank Account" THEN
            NroDocumento := BuscarNroDocumento(rec."Account No.");
        if NroDocumento <> ' ' then
            Rec."Document No." := NroDocumento;
*/


    end;

    LOCAL procedure NroSerieMasUno(UltimoNroSerie: Code[20]): Code[20]
    var
        Resultado: Code[20];
    begin
        Resultado := IncStr(UltimoNroSerie);
        // Evaluate(UltimoNroSerie)
        exit(Resultado)

    end;

    local procedure BuscarNroDocumento(NroCuenta: code[20]): code[50]
    var
        //  IdCliente: text[30];
        GenJournalLine: record "Gen. Journal Line";
    begin
        GenJournalLine.RESET();
        GenJournalLine.SETRANGE("Journal Template Name", 'RECIBOS D');
        GenJournalLine.SETRANGE("Account No.", NroCuenta);
        GenJournalLine.SETRANGE("Account Type", rec."Account Type"::Customer);
        if GenJournalLine.FINDSET() then
            /// ActualizarIDCliente(GenJournalLine."Account No.", GenJournalLine."Document No.");
            exit(GenJournalLine."Document No.");
    end;

    local procedure NroDocumentoLineaAnterior(NroLinea: Integer): Code[20]
    var
        GenJournalLine: record "Gen. Journal Line";
    begin
        GenJournalLine.Reset();
        GenJournalLine.SETRANGE("Journal Template Name", 'RECIBOS D');
        GenJournalLine.SetRange("Journal Batch Name", 'GENERICO.');
        GenJournalLine.SetRange("Line No.", NroLinea);
        if GenJournalLine.FindSet() then begin
            IF GenJournalLine."Account Type" = GenJournalLine."Account Type"::"Bank Account" then
                exit(GenJournalLine."Document No.")
            else
                exit('00-1')
        end;


    end;

    local procedure LineaAnterior(NroCuenta: code[20]): Integer
    var
        //  IdCliente: text[30];
        GenJournalLine: record "Gen. Journal Line";
    begin
        GenJournalLine.RESET();
        GenJournalLine.SETRANGE("Journal Template Name", 'RECIBOS D');
        GenJournalLine.SetRange("Journal Batch Name", 'GENERICO.');
        if GenJournalLine.FindLast() then
            /// ActualizarIDCliente(GenJournalLine."Account No.", GenJournalLine."Document No.");
            exit(GenJournalLine."Line No.");
    end;


}
