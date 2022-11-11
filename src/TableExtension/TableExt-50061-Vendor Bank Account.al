tableextension 50061 Vendor_bank_acc extends "Vendor Bank Account"
{
    // version NAVW19.00.00.45778\\pcpl0024_FILE GEN

    fields
    {
        field(50004; "IFSC Code"; Code[50])
        {
            Description = 'pcpl0024_FILE GEN';
        }
        field(50005; "Ben Acc Type"; Option)
        {
            Description = 'pcpl0024_FILE GEN';
            OptionCaption = '" ,Savings Bank,Current Account,Cash credit Account"';
            OptionMembers = " ","Savings Bank","Current Account","Cash credit Account";
        }
        field(50006; "Ben Branch Name"; Code[50])
        {
            Description = 'pcpl0024_FILE GEN';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

