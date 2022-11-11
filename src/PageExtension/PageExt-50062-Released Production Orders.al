pageextension 50062 Released_Production_orders extends "Released Production Orders"
{
    // version NAVW17.00

    layout
    {

    }
    actions
    {


        modify(ProdOrderJobCard)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderJobCard(Action 1903594306)". Please convert manually.

        modify(ProdOrderMaterialRequisition)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderMaterialRequisition(Action 1902917606)". Please convert manually.

        modify(ProdOrderShortageList)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderShortageList(Action 1903746906)". Please convert manually.

        addafter("Production Order - Picking List")
        {
            action("Production To QC2 Finished")
            {
                Caption = 'Production To QC2 Finished';
                RunObject = Report 50014;
                ApplicationArea = all;
            }
            action("production to QC Intermediate")
            {
                Caption = 'production to QC Intermediate';
                RunObject = Report 50028;
                ApplicationArea = all;
            }
        }
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

    //Unsupported feature: PropertyChange. Please convert manually.

}

