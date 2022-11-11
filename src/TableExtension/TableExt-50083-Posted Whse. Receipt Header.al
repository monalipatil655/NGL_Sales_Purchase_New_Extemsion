tableextension 50083 Posted_Whe_rec_hdr extends "Posted Whse. Receipt Header"
{
    // version NAVW19.00.00.45778

    fields
    {



        field(50002; "Manufacturer Name"; Text[100])
        {
            CaptionML = ENU = 'Manufacturer Name',
                        ENN = 'Manufacturer Name';
            Description = 'sanjay 07/July/2015';
        }
        field(50003; "Manufacturer Address"; Text[250])
        {
            CaptionML = ENU = 'Manufacturer Address',
                        ENN = 'Manufacturer Address';
            Description = 'sanjay 07/July/2015';
        }
        field(50008; "Packing details"; Text[250])
        {
            Description = 'sanjay 26/12/2016';
        }

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

