tableextension 50058 Bank_acc_Led_entry extends "Bank Account Ledger Entry"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778\\pcpl0024_FILE GEN

    fields
    {


        field(50000; Select; Boolean)
        {
            Description = 'pcpl0024_FILE GEN';
        }
        field(50001; Extracted; Boolean)
        {
            Description = 'pcpl0024_FILE GEN';
        }
        field(50002; "Type of payment"; Option)
        {
            Description = 'pcpl0024_FILE GEN';
            OptionCaption = '" ,RTGS,NEFT"';
            OptionMembers = " ",RTGS,NEFT;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

