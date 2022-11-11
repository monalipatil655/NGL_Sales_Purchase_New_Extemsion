pageextension 50058 Sales_Orer_list extends "Sales Order List"
{
    // version NAVW19.00.00.45778,GITLEXIM

    layout
    {

        //Unsupported feature: PropertyDeletion on "IncomingDocAttachFactBox(Control 20)". Please convert manually.

        addafter("External Document No.")
        {

            field("Buyer Reference No."; rec."Buyer Reference No.")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {




    }

    var
        PurchaseHeader: Record 38;
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
    end;
    //PCPL0017



}

