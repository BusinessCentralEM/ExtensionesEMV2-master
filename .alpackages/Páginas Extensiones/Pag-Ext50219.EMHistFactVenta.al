pageextension 50221 EMHistFactVenta extends "Posted Sales Invoice Lines"

{
    layout
    {
        addafter(Type)
        {
            field(CodRecurso; Rec.CodRecurso)
            {
                ApplicationArea = all;
                Caption = 'Cod. Recurso';
            }
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
                Caption = 'Fecha Creacion';
            }
        }

    }



}

