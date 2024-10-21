page 50174 APIRecursos
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiRecursos';
    DelayedInsert = true;
    EntityName = 'APIRecursos';
    EntitySetName = 'APIRecursos';
    PageType = API;
    SourceTable = Resource;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(CodActFijo; Rec.CodActFijo)
                {

                }
                field(Blocked; Rec.Blocked)
                {

                }
            }
        }
    }
}
