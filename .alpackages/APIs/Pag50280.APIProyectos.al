page 50280 APIProyectos2
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiProyectos2';
    DelayedInsert = true;
    EntityName = 'APIProyectos2';
    EntitySetName = 'APIProyectos2';
    PageType = API;
    SourceTable = Job;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                }
                field(jobPostingGroup; Rec."Job Posting Group")
                {
                    Caption = 'Job Posting Group';
                }
            }
        }
    }
}
