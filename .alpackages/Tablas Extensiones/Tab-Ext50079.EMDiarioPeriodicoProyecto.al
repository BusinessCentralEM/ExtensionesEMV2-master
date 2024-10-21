tableextension 50079 EMDiarioPeriodicoProyecto extends "Job Journal Line"
{
    fields
    {
        field(50028; "Baltic Modificado"; Text[30])
        {
            Caption = 'Baltic Modificado';
            DataClassification = ToBeClassified;
        }
        field(50037; "Prorrateado"; Boolean)
        {
            Caption = 'Prorrateado';
            DataClassification = ToBeClassified;
        }
    }
}
