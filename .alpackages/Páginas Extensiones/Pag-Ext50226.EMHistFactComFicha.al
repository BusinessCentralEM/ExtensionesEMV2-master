
pageextension 50226 EMHistFactComFicha extends "Posted Purchase Invoice"
{
    layout
    {
        addbefore("Posting Date")
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
