pageextension 50059 Purchase_Quotes extends "Purchase Quotes"
{
    // version NAVW19.00.00.46621

    layout
    {


    }
    actions
    {


        //Unsupported feature: PropertyDeletion on "Print(Action 51)". Please convert manually.


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

    //trigger (Variable: RecUser)();
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;

    RecUser.RESET;
    RecUser.SETRANGE(RecUser."User ID",USERID);
    IF RecUser.FINDFIRST THEN
    BEGIN
         TmpLocCode := RecUser."Location Code";
    END;

    IF TmpLocCode <> '' THEN
    BEGIN
    SETRANGE("Location Code",TmpLocCode);
    END;
    */
    //end;
}

