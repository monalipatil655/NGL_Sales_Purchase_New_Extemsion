tableextension 50074 Transfer_header extends "Transfer Header"
{
    // version NAVW19.00.00.46773,NAVIN9.00.00.46773,SUBCON1.0,PCPL/QC/V3/001

    fields
    {

        field(50000; "JW Delivery Challan"; Code[50])
        {
            Description = 'PCPL1.0';

            trigger OnValidate();
            begin
                //SUBCON1.0
                recTLine.RESET;
                recTLine.SETRANGE(recTLine."Document No.", "No.");
                IF recTLine.FINDFIRST THEN
                    REPEAT
                        recTLine."JW Delivery Challan" := "JW Delivery Challan";
                        recTLine.MODIFY;
                    UNTIL recTLine.NEXT = 0;
                //SUBCON1.0
            end;
        }
        field(50001; "Annexure 4(5) No."; Code[20])
        {
            Description = 'PCPL1.0';
            TableRelation = "Transfer Shipment Header"."No.";
        }

    }



    var
        recTLine: Record 5741;
}

