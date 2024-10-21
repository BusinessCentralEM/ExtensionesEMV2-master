codeunit 50059 EMAprobacionCompraAut
{
    //TableNo = "Purchase Header";
    Permissions = tabledata "Purchase Header" = RM, tabledata "Job Queue Entry" = RMI, tabledata "Purchase Line" = RMI;

    var
        PurchaseHeader: Record "Purchase Header";


    trigger OnRun()
    var
        FechaAprobacion: Date;
        PurchQuoteToOrder: Codeunit "Purch.-Quote to Order";

    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange(ActividadActual, PurchaseHeader.ActividadActual::"Aprobacion Nivel 3");
        PurchaseHeader.SetRange(IdAprobador, 2);
        PurchaseHeader.SetFilter(FechaAprobacionGcia, '<>%1', 0D);
        PurchaseHeader.SetRange(Pausadp, false);
        if PurchaseHeader.FindSet() then begin
            FechaAprobacion := CalcDate('+2D', PurchaseHeader.FechaAprobacionGcia);
            PurchaseHeader.SetRange(FechaAprobacionGcia, FechaAprobacion);
            PurchaseHeader.ActividadActual := PurchaseHeader.ActividadActual::Aprobado;
            PurchaseHeader.Modify();
            PurchQuoteToOrder.Run(PurchaseHeader);
            //   Message('Holaxd');*/

        end;




    end;

}
