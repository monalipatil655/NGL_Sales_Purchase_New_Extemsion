pageextension 50005 General_Led_entries extends "General Ledger Entries"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

    layout
    {

        addafter("Document No.")
        {
            field("Document Date"; rec."Document Date")
            {
                ApplicationArea = all;
            }
            // field("Source No."; rec."Source No.")
            // {
            //     ApplicationArea = all;
            // }
        }
        addafter(Description)
        {

            field("Transaction No."; rec."Transaction No.")
            {
                ApplicationArea = all;
            }
            field("Currency Code"; rec."Currency Code")
            {
                ApplicationArea = all;
            }
        }

        addafter("Entry No.")
        {
            field("Conversion Factor"; Rec."Conversion Factor")
            {
                Editable = false;

            }

        }
    }
    actions
    {


        addafter("Print Voucher")
        {
            action("Print Test")
            {
                CaptionML = ENU = 'Print Test',
                            ENN = 'Print Voucher';
                Ellipsis = true;
                Image = PrintVoucher;
                ApplicationArea = all;

                trigger OnAction();
                var
                    GLEntry: Record 17;
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", rec."Document No.");
                    GLEntry.SETRANGE("Posting Date", rec."Posting Date");
                    IF GLEntry.FINDFIRST THEN
                        REPORT.RUNMODAL(50091, TRUE, TRUE, GLEntry);
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "HasIncomingDocument(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //HasIncomingDocument : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HasIncomingDocument : 1000000000;
    //Variable type has not been exported.
}

