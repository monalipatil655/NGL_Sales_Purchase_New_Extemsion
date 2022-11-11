tableextension 50041 Transfer_Shipment_Line extends "Transfer Shipment Line"
{


    fields
    {
        field(50000; "JW Delivery Challan"; Code[50])
        {
            Description = 'RSPL1.0';
            Editable = false;
        }
        field(50001; "Annexure 4(5) No."; Code[20])
        {
            Description = 'RSPL1.0';
            Editable = false;
        }
        field(50002; "QR Code"; BLOB)
        {
            Description = '//PCPL-25 Qr code foreportr';
            SubType = Bitmap;
        }
    }
    keys
    {
        key(Key1; "Annexure 4(5) No.")
        {
        }
    }



    var
        recTHeader: Record 5740;
}

