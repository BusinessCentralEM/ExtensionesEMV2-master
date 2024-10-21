tableextension 50083 EMSalesLine extends "Sales Line"
{
    fields
    {
        field(50013; DisponibleCRM; Boolean)
        {
            Caption = 'DisponibleCRM';
            DataClassification = ToBeClassified;
        }
        field(50014; IDCRM; Code[100])
        {
            Caption = 'ID CRM';
            DataClassification = ToBeClassified;
        }

    }
}
