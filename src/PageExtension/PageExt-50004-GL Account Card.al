pageextension 50004 GL_Acc_Card extends "G/L Account Card"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,PCPL-Permission

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

