pageextension 50225 EMHistFactCom extends "Posted Purchase Invoices"
{
    layout
    {
        addbefore(Amount)
        {
            field(Solicitante; Rec.Solicitante)
            {
                ApplicationArea = all;
                Caption = 'Usuario Solicitante';
            }
            field("Jefe Aprobador"; Rec."Jefe Aprobador")
            {
                ApplicationArea = all;
                Caption = 'Jefe Aprobador';
            }
            field("Gerente Aprobador"; Rec."Gerente Aprobador")
            {
                ApplicationArea = all;
                Caption = 'Gerente aprobador';
            }
        }
    }

}

