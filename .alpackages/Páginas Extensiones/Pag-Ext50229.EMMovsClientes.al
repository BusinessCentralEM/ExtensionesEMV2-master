pageextension 50229 EMMovsClientes extends "Customer Ledger Entries"
{
    Editable = true;
    layout
    {
        addafter("Bal. Account No.")
        {
            field(EnvioCorreo; Rec.EnvioCorreo)

            {
                ApplicationArea = all;
            }
            field(UltimoCorreoEnviadoFecha; Rec.UltimoCorreoEnviadoFecha)
            {
                ApplicationArea = all;
                Editable = true;
            }
        }

    }



    actions
    {
        addlast(processing)
        {
            action(GenerarRecibo)
            {
                Caption = 'Generar Recibo';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Genera un PDF de la línea seleccionada';
                Visible = true;

                trigger OnAction()
                var
                    ReportRecibos: Report EMMovsClientesRecibos;
                begin
                    REPORT.RUN(Report::EMMovsClientesRecibos, false, false)
                end;


            }

        }
        /* modify(Category_Process)
         {

             Visible = true;
         }
         modify(Category_Category5)
         {
             Visible = true;
         }*/
        modify("F&unctions")
        {
            Visible = true;
        }
        modify("&Navigate")
        {
            Visible = true;
        }
        modify("Ent&ry")
        {
            Visible = true;
        }
    }

    var
        Visible: Boolean;

    trigger OnOpenPage()
    begin
        if (UserId = 'CONTACT.CENTER') then
            // Visible := false
            // Message('Prueba')
            Editable := false
        else
            //   Visible := true;

            EDITABLE := TRUE;

    end;

    trigger OnAfterGetRecord()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.RESET();
        SalesInvoiceLine.SetRange("Document No.", REC."Document No.");
        if SalesInvoiceLine.FINDSET() then begin
            rec.MesCobertura := SalesInvoiceLine.MesCobertura;
            rec.Modify();

        end
    end;

}


