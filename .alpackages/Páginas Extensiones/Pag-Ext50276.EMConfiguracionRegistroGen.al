pageextension 50276 EMConfiguracionRegistroGen extends "General Posting Setup"
{
    layout
    {
        addafter("Sales Account")
        {
            field("SalesLine Disc. Account"; Rec."Sales Line Disc. Account")
            {
                Editable = true;
                ApplicationArea = all;
            }
            field("SalesInv. Disc. Account"; Rec."Sales Inv. Disc. Account")
            {
                Editable = true;
                ApplicationArea = all;
            }
        }
    }
}
