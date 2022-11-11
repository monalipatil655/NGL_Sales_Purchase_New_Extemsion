pageextension 50030 Posted_sales_Shipment extends "Posted Sales Shipments"
{
    // version NAVW19.00.00.45778

    actions
    {



    }
    var
        RecUser: Record 91;
        TmpLocCode: Code[10];



    trigger OnOpenPage()
    begin

        RecUser.RESET;
        RecUser.SETRANGE(RecUser."User ID", USERID);
        IF RecUser.FINDFIRST THEN BEGIN
            TmpLocCode := RecUser."Location Code";
        END;

        IF TmpLocCode <> '' THEN BEGIN
            rec.SETRANGE("Location Code", TmpLocCode);
        END;
    end;





}

