tableextension 50084 "EMRegistroMantenimiento" extends "Maintenance Registration"
{
    fields
    {


    }
    trigger OnBeforeInsert()
    begin
        if "Service Date" = 0D then
            Error('El campo Fecha de servicio es obligatorio');
    end;

    /* trigger OnModify()
     BEGIN
         if "Service Date" = 0D then
             Error('El campo Fecha de servicio es obligatorio');
     END;*/
}
