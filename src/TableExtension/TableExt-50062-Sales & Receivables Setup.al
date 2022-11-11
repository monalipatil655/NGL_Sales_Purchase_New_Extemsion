tableextension 50062 Sales_rec_Setup extends "Sales & Receivables Setup"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316

    fields
    {

        //Unsupported feature: Deletion on ""Allow Document Deletion Before"(Field 46)". Please convert manually.

        field(50000; "No of Days"; DateFormula)
        {
            Description = '//PCPL 38';
        }
        field(50001; "Over Due Mail"; Text[80])
        {
            Description = '//PCPL 38';
        }
        field(50002; "Over Due Mail CC"; Text[80])
        {
            Description = '//PCPL 38';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

