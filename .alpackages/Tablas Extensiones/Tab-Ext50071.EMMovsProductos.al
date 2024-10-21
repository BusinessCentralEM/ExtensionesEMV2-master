tableextension 50071 EMMovsProductos extends "Item Ledger Entry"
{
    fields
    {
        field(50004; "Unidad de Negocio"; Text[30])
        {
            Caption = 'Unidad de Negocio';
            DataClassification = ToBeClassified;
        }

        field(50005; "Punto de Servicio"; Text[100])
        {

        }

        field(50006; "Nombre y apellido"; Text[100])
        {

        }
        field(50007; "Migrado METIRI"; Boolean)
        {

        }
    }
}
