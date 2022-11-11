pageextension 50061 Firm_Panned_Prod_orders extends "Firm Planned Prod. Orders"
{






    var
        RecUser: Record 91;
        TmpLocCode: Code[100];

    trigger OnOpenPage()
    begin

        //PCPL0017
        RecUser.RESET;
        RecUser.SETRANGE(RecUser."User ID", USERID);
        IF RecUser.FINDFIRST THEN BEGIN
            TmpLocCode := RecUser."Location Code";
        END;
        IF TmpLocCode <> '' THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETFILTER("Location Code", TmpLocCode);
            rec.FILTERGROUP(0);
        END;
        //PCPL0017
    end;
}

