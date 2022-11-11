pageextension 50032 Posted_Purchase_Receipts extends "Posted Purchase Receipts"
{
    // version NAVW19.00.00.45778,GITLEXIM

    layout
    {
        addafter("Buy-from Contact")
        {
            field("User ID"; rec."User ID")
            {
                ApplicationArea = all;
            }
        }
        addafter("Pay-to Vendor No.")
        {
            field(PackingDetails; rec.PackingDetails)
            {
                ApplicationArea = all;
            }
            field("Vendor Shipment No."; rec."Vendor Shipment No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("Shipment Method Code")
        {
            field("Order No."; rec."Order No.")
            {
                ApplicationArea = all;
            }
            field("Item Code"; rec."Item Code")
            {
                ApplicationArea = all;
            }
            field("Item Description"; rec."Item Description")
            {
                ApplicationArea = all;
            }
            field("GRN Qty"; rec."GRN Qty")
            {
                ApplicationArea = all;
            }
            field(Postingdatetime; rec.Postingdatetime)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {


    }

    var
        RecUser: Record 91;
        TmpLocCode: Code[100];


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



}

