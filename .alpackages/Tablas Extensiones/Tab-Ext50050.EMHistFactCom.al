tableextension 50050 EMHistFactCom extends "Purch. Inv. Header"
{
    fields
    {
        field(50010; Solicitante; Text[50])
        {
            Caption = 'Solicitante';
            DataClassification = ToBeClassified;
        }
        field(50011; "Jefe Aprobador"; Text[50])
        {
            Caption = 'Jefe Aprobador';
            DataClassification = ToBeClassified;
        }
        field(50012; "Gerente Aprobador"; Text[50])
        {
            Caption = 'Gerente Aprobador';
            DataClassification = ToBeClassified;
        }
    }
}
