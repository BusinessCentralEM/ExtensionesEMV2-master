pageextension 50281 EMControlFacturacion extends EM_ControlFacturacion
{
    layout
    {
        addafter(Descripcion)
        {
            field(DescripcionProyecto; DescripcionProyecto)
            {
                ApplicationArea = all;

            }
        }
    }
    var
        DescripcionProyecto: Text[100];

    trigger OnAfterGetRecord()
    var
        Proyectos: Record Job;
    begin
        Proyectos.Reset();
        Proyectos.SetRange("No.", rec.Proyecto);
        if Proyectos.FindSet() then begin
            DescripcionProyecto := Proyectos.Description;
        end;
    end;
}
