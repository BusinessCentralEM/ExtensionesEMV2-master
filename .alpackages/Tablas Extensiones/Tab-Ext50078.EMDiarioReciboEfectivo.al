tableextension 50078 EMDiarioReciboEfectivo extends "Gen. Journal Line"
{
    fields
    {
        field(50040; EnvioCorreo; Boolean)
        {
            Caption = 'EnvioCorreo';
            DataClassification = ToBeClassified;
        }
        field(50041; Banco; Enum ENUMBancos)
        {
            Caption = 'Banco';
            DataClassification = ToBeClassified;
        }
        field(50042; FechaEmisionCheque; Date)
        {
            Caption = 'Fecha emision cheque';
            DataClassification = ToBeClassified;
        }
        field(50043; FechaVencimientoCheque; Date)
        {
            Caption = 'Fecha vencimiento cheque';
            DataClassification = ToBeClassified;
        }
        field(50045; RegularizacionRecibos; Boolean)
        {
            Caption = 'Regularizacion de recibos';
            DataClassification = ToBeClassified;
        }
        field(50044; EnvioRecibo; Enum ENUMEnvioRecibo)
        {
            Caption = 'Envio de recibo';
            DataClassification = ToBeClassified;
            NotBlank = TRUE;

            /* trigger OnValidate()
             var
                 Serie: record "No. Series Line";
                 UltimoNroSerie: Code[20];
                 NroSerie: Code[20];

             begin
                 if rec.EnvioRecibo = EnvioRecibo::"1" THEN BEGIN
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
                     Clear(rec."Document No.");


             end;*/
        }
        modify("Account No.")
        {
            trigger OnAfterValidate()
            var
                NroDocumento: Code[50];
                Serie: record "No. Series Line";
                UltimoNroSerie: Code[20];
                NroSerie: Code[20];
                NroDocumentoLineaAnterior: Code[20];

            begin
                NroLineaAnterior := LineaAnterior("Account No.");
                NroDocumentoLineaAnterior := NroDocumentoLineaAnterior(NroLineaAnterior);
                IF (rec.EnvioRecibo = rec.EnvioRecibo::"1") and ("Account Type" = "Account Type"::"Bank Account") then begin
                    NroDocumento := BuscarNroDocumento(rec."Account No.");
                    // if NroDocumento <> '' then
                    rec."Document No." := NroDocumento;
                end
                ELSE
                    IF (rec.EnvioRecibo = rec.EnvioRecibo::"1") and ("Account Type" = "Account Type"::Customer) and (("Document No." = '00-1') or ("Document No." = '') or ("Document No." = NroDocumentoLineaAnterior))
                    THEN BEGIN

                        serie.Reset();
                        serie.Setrange("Series Code", 'RECIBO SERIES');
                        if serie.FindSet() then begin
                            UltimoNroSerie := Serie."Last No. Used";
                            NroSerie := NroSerieMasUno(UltimoNroSerie);
                            rec."Document No." := NroSerie;
                            //     rec.Modify();
                            serie."Last No. Used" := IncStr(serie."Last No. Used");
                            serie.Modify();
                        end;

                    END;

            end;


        }
        /*  modify("Document Type")
          {
              trigger OnAfterValidate()
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
                          serie."Last No. Used" := IncStr(serie."Last No. Used");
                          serie.Modify();
                      end;
                  END
                  else
                      Clear(rec."Document No.");


              end;
          }*/

        /* modify("Account No.")
         {

             trigger OnAfterValidate()
             var
                 NroDocumento: code[50];


             begin
                 IF "Account Type" = "Account Type"::"Bank Account" THEN
                     NroDocumento := BuscarNroDocumento(rec."Account No.");
                 if NroDocumento <> ' ' then
                     Rec."Document No." := NroDocumento;

             end;
         }*/
    }

    local procedure BuscarNroDocumento(NroCuenta: code[20]): code[50]
    var
        //  IdCliente: text[30];
        GenJournalLine: record "Gen. Journal Line";
    begin
        //Message('hola');
        GenJournalLine.RESET();
        GenJournalLine.SETRANGE("Journal Template Name", 'RECIBOS D');
        GenJournalLine.SetRange("Journal Batch Name", 'GENERICO.');
        if GenJournalLine.FindLast() then
            /// ActualizarIDCliente(GenJournalLine."Account No.", GenJournalLine."Document No.");
            exit(GenJournalLine."Document No.");
    end;


    trigger OnAfterInsert()
    var
        Serie: record "No. Series Line";
        UltimoNroSerie: Code[20];
        NroSerie: Code[20];
        NroDocumento: code[50];
    begin
        if (rec.EnvioRecibo = rec.EnvioRecibo::"1") and ("Account Type" <> "Account Type"::"Bank Account") and (("Document No." = '00-1') or ("Document No." = '')) tHEN BEGIN
            serie.Reset();
            serie.Setrange("Series Code", 'RECIBO SERIES');
            if serie.FindSet() then begin
                UltimoNroSerie := Serie."Last No. Used";
                NroSerie := NroSerieMasUno(UltimoNroSerie);
                rec."Document No." := NroSerie;
                //rec.Modify();
                serie."Last No. Used" := IncStr(serie."Last No. Used");
                serie.Modify();
            end;
        END
        /*     else
                 IF (rec.EnvioRecibo = rec.EnvioRecibo::"1") and ("Account Type" = "Account Type"::"Bank Account") then begin
                     NroDocumento := BuscarNroDocumento(rec."Account No.");
                     if NroDocumento <> '' then
                         rec."Document No." := NroDocumento;

                 end*/

        else
            if ((rec.EnvioRecibo = Rec.EnvioRecibo::"0") or (rec.EnvioRecibo = rec.EnvioRecibo::"2")) and ("Bal. Account No." <> 'RETENCION IVA')
            then
                Clear(rec."Document No.");


    end;


    /*trigger OnBeforeInsert()

    begin
        Message('Hola');
        if rec."Document No." = ' ' then
            rec."Document No." := '00-1';
        rec.Modify();
    end;*/

    procedure NroSerieMasUno(UltimoNroSerie: Code[20]): Code[20]
    var
        Resultado: Code[20];
    begin
        Resultado := IncStr(UltimoNroSerie);
        // Evaluate(UltimoNroSerie)
        exit(Resultado)

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
    END;

    var
        NroLineaAnterior: Integer;

}
