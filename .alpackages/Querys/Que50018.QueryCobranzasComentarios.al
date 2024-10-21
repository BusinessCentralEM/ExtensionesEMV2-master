query 50018 QueryCobranzasComentarios
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    EntityName = 'QueryCobranzasEscalamiento';
    EntitySetName = 'QueryCobranzasEscalamiento';
    QueryType = API;
    Permissions = tabledata EMCobranzas = r,
    tabledata EMCobranzaCabecera = r,
     tabledata "Sales Comment Line" = r;
    elements
    {
        dataitem(EMCobranzaCabecera; EMCobranzaCabecera)
        {
            DataItemTableFilter = Status = filter(Escalamiento | Derivado),
             Asignado2 = const(GciaComercial);
            //s DataItemLink = "Customer No" = EMCobranzas."Customer No";
            SqlJoinType = InnerJoin;
            // DataItemTableFilter = Status = FILTER('Confirmado');
            column(NombreContacto; NombreContacto)
            { }
            column(Telefono; Telefono)
            { }
            column(FormaPago; FormaPago)
            { }
            column(Status; Status)
            { }
            column(DireccionCobro; DireccionCobro)
            { }
            column(HorarioText; HorarioText)
            { }
            column(PersonaQueConfirma; PersonaQueConfirma)
            { }
            /* column(FechaCobro; FechaCobro)
             { }*/
            column(Asignado; Asignado)
            { }
            column(AgenteCC; AgenteCC)
            { }
            //  column(Status; Status)
            // { }
            column(FechaReagenda; FechaReagenda)
            { }
            column(Correo; Correo)
            { }
            dataitem(EMCobranzas; EMCobranzas)
            {
                DataItemTableFilter = Status = filter(0 .. 3 | 6);
                DataItemLink = "Customer No" = EMCobranzaCabecera."Customer No";
                SqlJoinType = InnerJoin;
                column(External_Document_No; "External Document No")
                { }
                column(DiasVencido; DiasVencido)
                { }
                column(Vencimiento; "Due Date")
                { }
                column(TerminoPago; TerminoPago)
                { }
                column(Importe_Factura; "Importe Factura")
                { }
                column(Importe_Pendiente; "Importe Pendiente")
                { }
                column(NombreCliente; "Customer Name")
                { }
                column(CodCliente; "Customer No")
                { }
                column(Document_No; "Document No")
                { }
                column(FechaCobro; FechaCobro)
                { }
                column(ID; ID)
                { }
                dataitem(Sales_Comment_Line; "Sales Comment Line")
                {
                    DataItemTableFilter = ResultadoContacto = filter(5), Migrado = filter(false);
                    DataItemLink = "No." = EMCobranzas."Document No";
                    SqlJoinType = LeftOuterJoin;
                    column(Comentario; Comentario) { }
                    column(Comment; Comment) { }
                    column(Migrado; Migrado) { }
                    column(SystemId; SystemId) { }
                    column(Document_Type; "Document Type") { }
                    column(Document_Line_No_; "Document Line No.") { }
                    column(No_; "No.") { }
                    column(Line_No_; "Line No.") { }
                    column(FechaComentario; SystemCreatedAt) { }
                }
            }
            /* dataitem(Sales_Comment_Line; "Sales Comment Line")
             {
                 DataItemLink = "No." = EMCobranzas."External Document No";
                 SqlJoinType = InnerJoin;
                 column(Comment; Comment) { }
             }*/
        }
    }
    trigger OnBeforeOpen()
    begin
    end;
}