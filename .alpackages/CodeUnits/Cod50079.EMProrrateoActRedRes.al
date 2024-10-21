codeunit 50085 EMProrrateoActRedRes
{
    //Permisos de tabla para Job Ledger Entry y Linea de planificación
    Permissions = tabledata "Job Ledger Entry" = RIMD,
    tabledata "Job Planning Line" = RIMD;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post Line", 'OnCreateJobLedgerEntryOnAfterAssignLedgerEntryTypeAndNo', '', true, true)]
    local procedure OnCreateJobLedgerEntryOnAfterAssignLedgerEntryTypeAndNo(var JobLedgEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line"; GLEntryNo: Integer)
    var
        MontoProrrateado: decimal;
        MontoProrrateadoAmpli: decimal;

    Begin

        IF ((JobJournalLine.FechaCreacionFORMAT <> 0D) or (JobJournalLine."Expiration Date" <> 0D)) and (JobJournalLine.Prorrateado = false)
          and ((JobJournalLine.TipoPresupuesto = 'AMPLIACIÓN') or (JobJournalLine.TipoPresupuesto = 'REDUCCIÓN') or (JobJournalLine.TipoPresupuesto = 'RESCISIÓN') or (JobJournalLine."Expiration Date" <> 0D)) Then begin

            MontoProrrateado := DevolverMontoProrrateado(JobJournalLine."Expiration Date", JobJournalLine.FechaCreacionFORMAT, JobLedgEntry."Unit Price");

            JobLedgEntry."Unit Price" := MontoProrrateado;
            JobLedgEntry."Unit Price (LCY)" := MontoProrrateado;
            JobLedgEntry."Total Price" := MontoProrrateado * JobLedgEntry.Quantity;
            JobLedgEntry."Total Price (LCY)" := MontoProrrateado * JobLedgEntry.Quantity;
            JobLedgEntry."Line Amount" := MontoProrrateado * JobLedgEntry.Quantity;
            JobLedgEntry."Line Amount (LCY)" := MontoProrrateado * JobLedgEntry.Quantity;
            JobJournalLine.Prorrateado := true;
            JobJournalLine.Modify();

        end
    end;



    Procedure DevolverMontoProrrateado(Fechacaducidad: date; FechaInicio: date; MontoAFacturar: decimal): decimal
    var
        MontoNuevo: decimal;
        UltimaFecha: date;
        Aux: integer;
        UltimoDiaMes: integer;
        PrimeraFecha: Date;
        UltimaFechaCaducidad: Date;
        UltimoDiaMesFechaCaducidad: Integer;
    begin





        if Fechacaducidad <> 0D then begin
            UltimaFechaCaducidad := CalcDate('PM', Fechacaducidad);
            UltimoDiaMesFechaCaducidad := Date2DMY(UltimaFechaCaducidad, 1);
            //31
            PrimeraFecha := CalcDate('-PM', Fechacaducidad);
            //01
            Aux := Fechacaducidad - PrimeraFecha;
            Aux := Aux + 1;
            //20
            MontoNuevo := (MontoAFacturar / UltimoDiaMesFechaCaducidad) * Aux;
        end
        else begin
            UltimaFecha := CalcDate('PM', FechaInicio);
            UltimoDiaMes := Date2DMY(UltimaFecha, 1);
            Aux := UltimaFecha - FechaInicio;
            Aux := Aux + 1;
            MontoNuevo := (MontoAFacturar / UltimoDiaMes) * Aux;

        end;

        exit(MontoNuevo);
    end;




}
