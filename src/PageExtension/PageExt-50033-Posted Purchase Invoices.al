pageextension 50033 Posted_Purchase_Invoice extends "Posted Purchase Invoices"
{
    // version NAVW19.00.00.45778,GITLEXIM

    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("GRN No."; rec."GRN No from line")
            {
                Caption = 'GRN No.';
            }
        }
    }
    actions
    {



    }

    var
        TmpLocCode: Code[100];
        RecUser: Record 91;



    trigger OnOpenPage();
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

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

