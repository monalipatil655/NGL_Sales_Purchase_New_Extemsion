pageextension 50007 Cust_Led_entry extends "Customer Ledger Entries"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

    layout
    {


    }
    actions
    {

        addafter("Print Voucher")
        {
            action("Over Due Mail")
            {
                ApplicationArea = all;
                trigger OnAction();
                begin
                    CustLedgerEntry.RESET;
                    CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", rec."Document No.");
                    IF CustLedgerEntry.FINDFIRST THEN BEGIN
                        REPORT.RUN(50038, FALSE, FALSE, CustLedgerEntry);
                    END;
                end;
            }
        }
        addafter(SelectIncomingDoc)
        {
            action("Incoming Document")
            {
                CaptionML = ENU = 'Incoming Document',
                            ENN = 'Incoming Document';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction();
                var
                    IncomingDocument: Record 130;
                begin
                    IncomingDocument.HyperlinkToDocument(rec."Document No.", rec."Posting Date");
                end;
            }
        }

    }

    var
        CustLedgerEntry: Record 21;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

