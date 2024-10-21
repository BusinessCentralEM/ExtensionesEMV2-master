page 50182 APIItems
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiItems';
    DelayedInsert = true;
    EntityName = 'APIItems';
    EntitySetName = 'APIItems';
    PageType = API;
    SourceTable = Item;

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
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(Inventory; Rec.Inventory)
                {
                    Caption = 'Inventario';
                }
                field("PriceIncludesVAT"; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field("UnitPrice"; Rec."Unit Price")
                {
                    Caption = 'UniPrice';
                }

            }
        }
    }
}
