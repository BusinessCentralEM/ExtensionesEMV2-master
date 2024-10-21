pageextension 50273 EMMovsProductos extends "Item Ledger Entries"
{


    layout

    {
        addafter("Global Dimension 1 Code")
        {
            field("Unidad de Negocio"; Rec."Unidad de Negocio")
            {
                ApplicationArea = all;
                Caption = 'Unidad de Negocio';

            }

        }
        addafter("Global Dimension 2 Code")
        {
            field("Punto de Servicio"; Rec."Punto de Servicio")
            {
                ApplicationArea = all;
                Caption = 'Punto de servicio';
            }



        }
        addafter(CodLegajo)
        {
            field("Nombre y apellido"; Rec."Nombre y apellido")
            {
                ApplicationArea = all;
                Caption = 'Nombre y apellido';
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Empleados: Record Employee;
        Dimensiones: Record "Dimension Value";
        Items: Record Item;

    begin
        Empleados.Reset();
        Empleados.SetRange("No.", rec.CodLegajo);
        if Empleados.FindSet() then begin
            rec."Nombre y apellido" := Empleados."Last Name" + ' ' + Empleados.Name;
            //  Rec.Modify();
        end
        else
            Clear(REC."Nombre y apellido");

        Dimensiones.Reset();
        Dimensiones.SetRange("Dimension Code", 'UN');
        Dimensiones.SetRange(Code, rec."Global Dimension 1 Code");
        if Dimensiones.FindSet() then begin
            rec."Unidad de Negocio" := Dimensiones.Name;
            // rec.Modify()
        end
        else
            Clear(rec."Unidad de Negocio");


        Dimensiones.Reset();
        Dimensiones.SetRange(Code, rec."Global Dimension 2 Code");
        if Dimensiones.FindSet() then begin
            rec."Punto de Servicio" := Dimensiones.Name;
            //  rec.Modify()
        end
        else
            Clear(rec."Punto de Servicio");

        Items.Reset();
        Items.SetRange("No.", Rec."Item No.");
        if Items.FindSet() then begin
            rec.Description := Items.Description;
            //rec.Modify()
        end
        else
            Clear(Rec.Description);



    end;


}