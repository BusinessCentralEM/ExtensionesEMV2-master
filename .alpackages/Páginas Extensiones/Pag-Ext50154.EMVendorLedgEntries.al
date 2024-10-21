pageextension 50252 EM_VendorLedgEntries extends "Vendor Ledger Entries"
{
    layout
    {
        // la etiqueta del campo Description a comentario 
        addafter("Vendor No.")
        {
            field(NombreDeProveedor; rec."Vendor Name")
            {
                Caption = 'Nombre Proveedor';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(ReverseTransaction)
        {
            action("ReporteOCHistorico")
            {
                ApplicationArea = ALL;
                Caption = 'Reporte Orden Pago Historico';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Report;


                trigger OnAction()
                var
                    ReporteOrdenPagoHist: Report EM_OrdenPagoHistorico;
                    VendLedgEntry: record "Vendor Ledger Entry";

                begin

                    VendLedgEntry.RESET;
                    //GenJnlLine.COPY(Rec);
                    VendLedgEntry.SETRANGE("Document No.", Rec."Document No.");
                    IF VendLedgEntry.FINDSET THEN
                        REPORT.RUN(REPORT::EM_OrdenPagoHistorico, TRUE, TRUE, VendLedgEntry);
                end;


            }
        }

    }// Fin Layout
    //Inicio Trigger OnAftergetrecord
    // Se obtiene el nombre del proveedor desde la tabla vendor pasando el codigo de vendedor desde la tabla 29 Vendor Ledger Entry
    // si se encuentra se guarda en la variable VendorName de tipo texto, luego se asigna ese valor al campo Nombreproveedor
    trigger OnAfterGetRecord()
    begin
        TableVendor.RESET();
        TableVendor.SetRange("No.", rec."Vendor No.");
        if (TableVendor.FindSet()) then begin
            VendorName := tablevendor.Name;
        end
        else
            clear(VendorName);

        //Asignacion 
        rec."Vendor Name" := VendorName;

    end;

    // declaracion de variables
    var
        VendorName: Text[100];

    var
        TableVendor: record Vendor;


}

