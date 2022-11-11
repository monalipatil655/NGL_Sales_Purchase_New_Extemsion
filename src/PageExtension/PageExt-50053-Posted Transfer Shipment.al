pageextension 50053 Posted_tranfer_shipment extends "Posted Transfer Shipment"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0

    layout
    {

        addafter("Posting Date")
        {
            field("JW Delivery Challan"; rec."JW Delivery Challan")
            {
                ApplicationArea = all;
            }
            field("Annexure 4(5) No."; rec."Annexure 4(5) No.")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {



        addafter("&Print")
        {
            // action("Delivery Challan ")
            // {
            //     ApplicationArea = all;

            //     trigger OnAction();
            //     begin
            //         /* //NSW07
            //         CLEAR(RepDeliveryChallan);
            //         TransShipment.RESET;
            //         TransShipment.SETRANGE("No.", "No.");
            //         IF TransShipment.FINDFIRST THEN BEGIN
            //             RepDeliveryChallan.SETTABLEVIEW(TransShipment);
            //             RepDeliveryChallan.RUNMODAL;
            //         END ELSE
            //             ERROR(Text001);
            //             */ //NSW07

            //     end;
            // }
        }
    }

    var
        //RepDeliveryChallan: Report 50091; //NSW07
        TransShipment: Record 5744;
        Text001: Label 'Report not Found';
        TransferShipmentHeader: Record 5744;
        TransferShipmentLine: Record 5745;

    //Unsupported feature: PropertyChange. Please convert manually.

}


