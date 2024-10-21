pageextension 50257 EMJobQueueEntry extends "Job Queue Entries"
{
    layout
    {
        addafter("Earliest Start Date/Time")
        {
            field("Parametros"; Rec."Parameter String")
            {
                Caption = 'Parametros';
                ApplicationArea = all;
            }
        }
    }
}
