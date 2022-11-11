tableextension 50085 Production_BOM_Headr extends "Production BOM Header"
{
    // version NAVW19.00.00.45778

    fields
    {
        field(50000; "Location Code"; Code[20])
        {
            Description = 'NGL/CUST/001';
            TableRelation = Location;
        }
        field(50002; "Batch Size"; Integer)
        {
            Description = 'sanjay 19/01/2017';
        }
    }
}

