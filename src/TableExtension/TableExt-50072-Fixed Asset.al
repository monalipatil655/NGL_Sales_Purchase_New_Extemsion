tableextension 50072 Fixed_Asset extends "Fixed Asset"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,//PCPL-FA

    fields
    {




        field(50101; Insurance; Boolean)
        {
        }
        field(50102; "Salvage Value Applicable"; Boolean)
        {
            Description = '//PCPL-FA';
        }

    }
    keys
    {
        key(Key12; "Serial No.")
        {
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

