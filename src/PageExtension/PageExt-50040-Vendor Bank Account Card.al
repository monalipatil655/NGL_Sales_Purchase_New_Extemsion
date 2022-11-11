pageextension 50040 Vend_bank_acc_card extends "Vendor Bank Account Card"
{
    // version NAVW19.00.00.45778/pcpl0024_FILE GEN

    layout
    {
        addafter("Transit No.")
        {
            field("IFSC Code"; rec."IFSC Code")
            {
                ApplicationArea = all;
            }
            field("Ben Acc Type"; rec."Ben Acc Type")
            {
                ApplicationArea = all;
            }
            field("Ben Branch Name"; rec."Ben Branch Name")
            {
                ApplicationArea = all;
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

