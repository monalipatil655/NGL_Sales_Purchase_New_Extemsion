tableextension 50086 Transfer_receipt_line extends "Transfer Receipt Line"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0

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


}

