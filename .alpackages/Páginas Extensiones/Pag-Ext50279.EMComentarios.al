pageextension 50285 EMComentarios extends "Sales Comment Sheet"
{
    layout
    {
        addafter(ResultadoContacto)
        {
            field("Persona contactada"; Rec."Persona contactada")
            {
                Caption = 'Persona contactada';
                ApplicationArea = all;
            }
        }
    }
}
