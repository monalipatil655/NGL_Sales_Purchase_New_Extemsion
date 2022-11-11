pageextension 50052 Get_Receipt_lines extends "Get Receipt Lines"
{
    // version NAVW19.00.00.45778,GITLEXIM

    actions
    {

        //Unsupported feature: CodeModification on "Action 46.OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchRcptHeader.GET("Document No.");
        PAGE.RUN(PAGE::"Posted Purchase Receipt",PurchRcptHeader);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PurchRcptHeader.GET("Document No.");
        //001 Start
        IF PurchHeader."Import Document" THEN
          PAGE.RUN(PAGE::"Posted Import Receipt",PurchRcptHeader)
        ELSE
        //001 End
        PAGE.RUN(PAGE::"Posted Purchase Receipt",PurchRcptHeader);
        */
        //end;
    }


    //Unsupported feature: CodeInsertion on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    var
        RecUser: Record 91;
        TmpLocCode: Code[10];
    //begin
    /*
    {
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
    }
    */
    //end;

    procedure SetSource(var PurchRcptLine: Record 121);
    begin
        rec.DELETEALL;
        IF PurchRcptLine.FINDSET THEN
            REPEAT
                Rec := PurchRcptLine;
                rec.INSERT;
            UNTIL PurchRcptLine.NEXT = 0;
    end;


}

