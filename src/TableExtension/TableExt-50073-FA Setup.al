tableextension 50073 FA_setup extends "FA Setup"
{
    // version NAVW19.00.00.45778,PCPL-FA-1.0,//PCPL-FA

    fields
    {
        field(50000; "Maintenance Nos."; Code[10])
        {
            Description = '//PCPL-FA-1.0';
            TableRelation = "No. Series";
        }
        field(50001; "Salvage Value %"; Decimal)
        {
            Description = '//PCPL-FA';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

