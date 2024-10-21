page 50169 WSCUSTOMER
{
    APIGroup = 'Master';
    APIPublisher = 'EM';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'wscustomer';
    DelayedInsert = true;
    EntityName = 'WSCUSTOMER';
    EntitySetName = 'WSCUSTOMER';
    PageType = API;
    SourceTable = Customer;
    Permissions = tabledata Customer = RIMD;
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
    [ServiceEnabled]

    procedure AddCustomerURL(CustomerCode: Code[20]; WebURL: Text; Description: Text)
    var
        AddLinkMgt: Codeunit "Customer Add-Link";
        actionContext: WebServiceActionContext;
    begin
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::"WSCUSTOMER");
        actionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        AddLinkMgt.addLink(REC."No.", WebURL, Description);
        actionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;
}
