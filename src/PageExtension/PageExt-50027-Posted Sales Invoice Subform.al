pageextension 50027 Posted_Sales_inv_Subform extends "Posted Sales Invoice Subform"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,PCPL-25/proofExp

    layout
    {
        addafter("Unit Price")
        {

            field("Proof of Export"; rec."Proof of Export")
            {
                ApplicationArea = all;

                trigger OnValidate();
                begin
                    //PCPL-25
                    IF Usersetup.GET(USERID) THEN
                        Usersetup.TESTFIELD("Proof of Export");
                    //PCPL-25
                end;
            }
        }
    }
    actions
    {
        addafter(ItemShipmentLines)
        {
            action("Proof Of Export.")
            {
                ApplicationArea = all;
                trigger OnAction();
                begin
                    //PCPL-25
                    SIL.RESET;
                    SIL.SETRANGE("Document No.", rec."Document No.");
                    SIL.SETRANGE("Line No.", rec."Line No.");
                    SIL.SETRANGE("Proof of Export", TRUE);
                    IF SIL.FINDFIRST THEN BEGIN
                        SIL.VALIDATE("Proof of Export", FALSE);
                        SIL.MODIFY;
                    END;
                    //PCPL-25
                end;
            }
        }
    }

    var
        Usersetup: Record 91;
        EditField: Boolean;
        SIL: Record 113;



}

