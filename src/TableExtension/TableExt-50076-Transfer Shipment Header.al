tableextension 50076 Transfer_Ship_header extends "Transfer Shipment Header"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0,PCPL/QC/V3/001

    fields
    {


        field(50000; "JW Delivery Challan"; Code[50])
        {
            Description = 'PCPL1.0';
            Editable = false;
        }
        field(50001; "Annexure 4(5) No."; Code[20])
        {
            Description = 'PCPL1.0';
            Editable = false;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

