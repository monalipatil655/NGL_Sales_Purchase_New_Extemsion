pageextension 50031 Posted_Sales_invoices_Ext extends "Posted Sales Invoices"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM

    layout
    {


    }
    actions
    {

    }

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

