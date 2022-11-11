pageextension 50010 Ven extends "Vendor Ledger Entries"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

    layout
    {


    }
    actions
    {

        addafter("Print Voucher")
        {
            action("Payment Advice")
            {
                CaptionML = ENU = 'Payment Advice',
                            ENN = 'Print Voucher';
                Ellipsis = true;
                Image = PrintVoucher;
                ApplicationArea = all;

                trigger OnAction();
                var
                    VendorLedgerEntry: Record 25;
                begin
                    VendorLedgerEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    VendorLedgerEntry.SETRANGE("Document No.", rec."Document No.");
                    VendorLedgerEntry.SETRANGE("Posting Date", rec."Posting Date");
                    IF VendorLedgerEntry.FIND('-') THEN
                        REPORT.RUNMODAL(50008, TRUE, TRUE, VendorLedgerEntry);
                end;
            }
        }
        addfirst(IncomingDocument)
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

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

