tableextension 50075 Transfer_line extends "Transfer Line"
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
    }


    trigger OnInsert()
    begin
        //SUBCON1.0
        recTHeader.GET("Document No.");
        "JW Delivery Challan" := recTHeader."JW Delivery Challan";
        "Annexure 4(5) No." := recTHeader."Annexure 4(5) No.";
        //SUBCON1.0
    end;

    var
        recTHeader: Record 5740;
        recTransHdr: Record 5740;
}

