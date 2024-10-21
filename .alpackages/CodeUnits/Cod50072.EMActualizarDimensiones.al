codeunit 50077 EMActualizarDimensiones
{
    TableNo = Resource;
    Permissions = tabledata "Fixed Asset" = RIMD, tabledata Resource = RIMD, tabledata "Res. Ledger Entry" = RIMD;

    trigger OnRun()
    begin

    end;
    /*var
        Recurso: Record Resource;
    begin
        Recurso.Reset();
        Recurso.SetFilter(CodActFijo, '<>%1', '');
        if Recurso.FindSet() then begin
            repeat
                MovsRecurso.Reset();
                MovsRecurso.SetCurrentKey("Posting Date");
                MovsRecurso.SetAscending("Posting Date", true);
                MovsRecurso.SetRange("Resource No.", Recurso."No.");
                MovsRecurso.SetRange("Posting Date", FechaInicio, FechaFinal);
                if MovsRecurso.FindLast() then begin
                    FixedAsset.Reset();
                    FixedAsset.SetRange("No.", Recurso.CodActFijo);
                    If FixedAsset.FindFirst() then begin
                        FixedAsset."Global Dimension 1 Code" := MovsRecurso."Global Dimension 1 Code";
                        FixedAsset."Global Dimension 2 Code" := MovsRecurso."Global Dimension 2 Code";
                        FixedAsset.Validate("Global Dimension 1 Code");
                        FixedAsset.Validate("Global Dimension 2 Code");
                        FixedAsset.Modify();
                    end
                end
            until Recurso.Next() = 0

        end;




    end;*/

    procedure ActualizarDimensiones(CodActivo: code[50])
    var
        FixedAsset: Record "Fixed Asset";
        MovsRecurso: Record "Res. Ledger Entry";
        Res: Record Resource;
    begin
        MovsRecurso.Reset();
        MovsRecurso.SetCurrentKey("Posting Date");
        MovsRecurso.SetAscending("Posting Date", true);
        MovsRecurso.SetRange("Resource No.", CodActivo);
        //MovsRecurso.SetRange("Posting Date", FechaInicio, FechaFinal);
        if MovsRecurso.FindLast() then begin
            FixedAsset.Reset();
            FixedAsset.SetRange("No.", CodActivo);
            If FixedAsset.FindFirst() then begin
                FixedAsset."Global Dimension 1 Code" := MovsRecurso."Global Dimension 1 Code";
                FixedAsset."Global Dimension 2 Code" := MovsRecurso."Global Dimension 2 Code";
                FixedAsset.Validate("Global Dimension 1 Code");
                FixedAsset.Validate("Global Dimension 2 Code");
                FixedAsset.Modify();
            end
        end


    end;


}
