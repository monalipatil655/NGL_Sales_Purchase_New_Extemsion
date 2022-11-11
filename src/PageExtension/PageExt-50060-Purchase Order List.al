pageextension 50060 Purchase_order_list extends "Purchase Order List"
{
    // version NAVW19.00.00.46621,NAVIN9.00.00.46621,GITLEXIM

    layout
    {



    }
    actions
    {


        modify(Reopen)
        {
            trigger OnBeforeAction()
            begin
                rec.TESTFIELD("Reason Code"); //PCPL0017
            end;
        }
        modify(CancelApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                rec.TESTFIELD("Reason Code"); //PCPL0017
            end;
        }



    }

    var
        SalesHeader: Record 36;
        RecUser: Record 91;
        TmpLocCode: Code[100];
        DimMgt: Codeunit 408;


    trigger OnOpenPage()
    begin
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
    end;


}

