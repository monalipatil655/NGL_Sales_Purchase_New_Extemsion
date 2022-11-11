pageextension 50038 Bank_Acc_Rec_Lines extends "Bank Acc. Reconciliation Lines"
{
    // version NAVW19.00.00.45778

    layout
    {

        addafter("Document No.")
        {
            field("Manual Cheque No."; rec."Manual Cheque No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Ready for Application"; rec."Ready for Application")
            {
                ApplicationArea = all;
            }
            field("Transaction Text"; rec."Transaction Text")
            {
                ApplicationArea = all;
            }
        }
    }
}

