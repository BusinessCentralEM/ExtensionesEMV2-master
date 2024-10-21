page 50184 APIFactVentaOC
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiFactVentaOC';
    DelayedInsert = true;
    EntityName = 'APIFactVentaOC';
    EntitySetName = 'APIFactVentaOC';
    PageType = API;
    SourceTable = "Sales Line";
    // UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field("DocumentNo"; Rec."Document No.")
                {

                }
                field("BilltoCustomerNo"; Rec."Bill-to Customer No.")
                {

                }
                field("DocumentType"; Rec."Document Type")
                {

                }
                FIELD("JobTaskNo"; Rec."Job Task No.")
                {

                }
                field(MesCobertura; Rec.MesCobertura)
                {

                }
                field(Anho; Rec.Anho)
                {

                }
                field(Amount; Rec.Amount)
                {

                }
                field("AmountIncludingVAT"; Rec."Amount Including VAT")
                {

                }
                FIELD(PeriodoMesAnho; PeriodoMesAnho)
                {

                }
                field("JobNo"; Rec."Job No.")
                {

                }
                field(FechaProvision; FechaProvision)
                {

                }
                field(Puesto; Rec.Puesto)
                {

                }
                field(Sector; Rec.Sector)
                {

                }
                field(DisponibleCRM; Rec.DisponibleCRM)
                {

                }
                field("GenProdPostingGroup"; Rec."Gen. Prod. Posting Group")
                {

                }
                field(IDCRM; Rec.IDCRM)
                {

                }

                field(VolverAMigrarCRM; Rec.VolverAMigrarCRM)
                {

                }


            }
        }
    }
    trigger OnAfterGetRecord()
    var
        PeriodoMes: Text[20];
        AnhoString: Text[5];

    begin


        //Buscar Cliente requiere OC    
        Cliente.Reset();
        Cliente.SetRange("No.", rec."Bill-to Customer No.");
        Cliente.SetRange(ExReqOC, true);
        if Cliente.FindSet() then begin
            //rec.SetRange("Bill-to Customer No.", Cliente."No.");
            // rec.SetRange(rec."Document Type", rec."Document Type"::Invoice, Rec."Document Type"::Order);
            rec.SetFilter(rec."Document Type", '%1|%2', rec."Document Type"::Invoice, Rec."Document Type"::Order);
            rec.setfilter(rec."No.", '<>%1', 'CRM');
            rec.SetFilter(rec."Gen. Prod. Posting Group", '<>%1', 'UNIFORME');
            //rec.SetFilter(REC."Document Type", '<>%1', "Sales Document Type"::"Credit Memo");
            case rec.MesCobertura of
                REC.MesCobertura::Enero:
                    PeriodoMes := '1';
                rec.MesCobertura::Febrero:
                    PeriodoMes := '2';
                REC.MesCobertura::Marzo:
                    PeriodoMes := '3';
                REC.MesCobertura::Abril:
                    PeriodoMes := '4';
                REC.MesCobertura::Mayo:
                    PeriodoMes := '5';
                REC.MesCobertura::Junio:
                    PeriodoMes := '6';
                REC.MesCobertura::Julio:
                    PeriodoMes := '7';
                REC.MesCobertura::Agosto:
                    PeriodoMes := '8';
                REC.MesCobertura::Septiembre:
                    PeriodoMes := '9';
                REC.MesCobertura::Octubre:
                    PeriodoMes := '10';
                REC.MesCobertura::Noviembre:
                    PeriodoMes := '11';
                REC.MesCobertura::Diciembre:
                    PeriodoMes := '12';
            end;
            AnhoString := Format(rec.Anho);
            PeriodoMesAnho := PeriodoMes + '/' + AnhoString;
        end;
        FechaProvision := ObtenerFechaProvision(rec."Document No.");
        /*  TablaOC.Reset();
          TablaOC.SetRange(NroProyecto, rec."Job No.");
          TablaOC.SetRange(NroTareaProyecto, REC."Job Task No.");
          IF TablaOC.FindSet() then begin
              Repeat
                  MesAnhoOC := Format(Date2DMY(TablaOC.PeriodoFacturacion, 2)) + '/' + Format(Date2DMY(TablaOC.PeriodoFacturacion, 3));
                  // Message(MesAnhoOC + '1' + PeriodoMesAnho + '2');
                  if MesAnhoOC = PeriodoMesAnho then
                      Rec.Next()

               UNTIL TablaOC.Next() = 0



          end;
    */



    end;

    /*trigger OnOpenPage()
    BEGIN
        rec.SetFilter(MesCobertura, '<>%1', 0);
    END;*/
    local procedure ObtenerFechaProvision(DocumentNo: Code[20]): Date
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", DocumentNo);
        if SalesHeader.findset then
            exit(SalesHeader.FechaProvision);
    end;

    VAR
        PeriodoMesAnho: Text[20];
        Cliente: Record Customer;
        TablaOC: Record EM_OC;
        MesAnhoOC: Text[20];
        FechaProvision: Date;

}
