page 50068 "Payment Terms PortalUse"
{
    // version pcpl002430oct2018

    PageType = List;
    SourceTable = 50068;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; rec.Code)
                {
                    TableRelation = "Payment Terms".Code;
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        recpayment.RESET;
                        recpayment.SETRANGE(recpayment.Code, rec.Code);
                        IF recpayment.FINDFIRST THEN BEGIN
                            rec.Descripion := recpayment.Description;
                        END;
                    end;
                }
                field(Descripion; rec.Descripion)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    var
        recpayment: Record 3;
}

