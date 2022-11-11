tableextension 50234 tableextension50234 extends "Bank Account"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    fields
    {


        field(50001; "AD Code"; Code[20])
        {
        }
        field(50002; "RTGS Code"; Code[20])
        {
        }
        field(50003; "MICR CODE"; Code[10])
        {
        }
        field(50004; "correspondence Bank"; Text[250])
        {
            Description = '//Bank Details';
        }
        field(50005; "Correspondence Bank For Euro"; Text[250])
        {
            Description = '//PCPL-25 bank details';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

