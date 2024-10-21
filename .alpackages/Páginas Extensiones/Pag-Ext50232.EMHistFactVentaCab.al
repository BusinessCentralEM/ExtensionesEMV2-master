pageextension 50232 EMHistFactVentaCab extends "Posted Sales Invoice"
{

    layout
    {
        addafter(Cancelled)
        {
            field(Refacturacion; Rec.Refacturacion)
            {
                ApplicationArea = ALL;
            }
        }
    }
    actions
    {


        modify(Category_Process)
        {
            Visible = visible;
        }
        modify(Category_Category5)
        {
            Visible = visible;
        }
        modify(Category_Category6)
        {
            Visible = visible;
        }
        modify(Category_Category4)
        {
            Visible = visible;
        }
        modify("Category_Incoming Document")
        {
            Visible = visible;
        }
        modify("F&unctions")
        {
            Visible = visible;
        }
        modify("&Navigate")
        {
            Visible = visible;
        }
        modify(Print)
        {
            Visible = visible;
        }
        modify(SendCustom)
        {
            Visible = visible;
        }
        modify(Email)
        {
            Visible = visible;
        }
        modify(AttachAsPDF)
        {
            Visible = visible;
        }
        modify(ActivityLog)
        {
            Visible = visible;
        }
        modify(IncomingDocument)
        {
            Visible = visible;
        }
        modify(CorrectInvoice)
        {
            Visible = visible;
        }
        modify(Customer)
        {
            Visible = visible;
        }
        modify("Update Document")
        {
            Visible = visible;
        }
        modify(Invoice)
        {
            Visible = visible;
        }
        modify(CreateCreditMemo)
        {
            Visible = visible;
        }
        modify(CancelInvoice)
        {
            Visible = visible;
        }
        modify(Statistics)
        {
            Visible = visible;
        }
        modify("Co&mments")
        {
            Visible = visible;
        }
        modify(Dimensions)
        {
            Visible = visible;
        }
        modify(Approvals)
        {
            Visible = visible;
        }
        modify(DocAttach)
        {
            Visible = visible;
        }
        modify(SpecialSchemeCodes)
        {
            Visible = visible;
        }
        modify(ChangePaymentService)
        {
            Visible = visible;
        }






    }
    var
        Visible: Boolean;

    trigger OnOpenPage()
    begin
        if (UserId = 'CONTACTCENTER') then
            Visible := false
        else
            Visible := true;

    end;

}
