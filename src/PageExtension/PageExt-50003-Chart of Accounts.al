pageextension 50003 Chart_of_Acc extends "Chart of Accounts"
{
    // version NAVW19.00.00.45778,PCPL-Permission

    var
        UserSetup: Record 91;


    //Unsupported feature: CodeInsertion on "OnOpenPage". Please convert manually.

    trigger OnOpenPage();
    begin

        //PCPL-Permission
        UserSetup.GET(USERID);
        IF UserSetup."Chart of Account Access" = FALSE THEN
            ERROR('You do not have access of this page. Please contact System Admin');
        //PCPL-Permission

    end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

