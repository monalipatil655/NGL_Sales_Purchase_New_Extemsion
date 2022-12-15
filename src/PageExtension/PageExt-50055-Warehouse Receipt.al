pageextension 50055 Warehouse_receipt extends "Warehouse Receipt"
{
    // version NAVW19.00.00.45778

    layout
    {

        modify("Document Status")
        {
            Editable = true;
        }
        addafter("Sorting Method")
        {
            field("Manufacturing Date"; rec."Manufacturing Date")
            {
                ApplicationArea = all;
            }
            field("Expairy Date"; rec."Expairy Date")
            {
                ApplicationArea = all;
            }
            field("Manufacturer Name"; rec."Manufacturer Name")
            {
                ApplicationArea = all;
            }
            field("Manufacturer Address"; rec."Manufacturer Address")
            {
                ApplicationArea = all;
            }
            field("Packing details"; rec."Packing details")
            {
                ApplicationArea = all;
            }
            // field("Vendor Shipment Date/BOL"; rec."Vendor Shipment Date")
            // {
            //     ApplicationArea = all;
            // }          

        }

    }
    actions
    {

        modify("Post Receipt")
        {
            trigger OnBeforeAction()
            begin
                //
                LinesPostedValidate(Rec);     //PCPL-BRB - 20220111
                WhseRecpHeader.RESET;
                WhseRecpHeader.SETRANGE(WhseRecpHeader."No.", rec."No.");
                IF rec."Bin Code" = '' THEN BEGIN
                    WhseRecpHeader.TESTFIELD("Bin Code");
                END;
                // PCPL-0025

            end;
        }
        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            begin
                LinesPostedValidate(Rec);     //PCPL-BRB - 20220111
            end;
        }

    }

    var
        WhseRecpHeader: Record 7316;

    local procedure LinesPostedValidate(WarehouseReceiptHeader: Record 7316);
    var
        WarehouseReceiptLine: Record 7317;
        WhseRecpHeader: Record 7316;
        i: Integer;
    begin
        IF WhseRecpHeader.GET(WarehouseReceiptHeader."No.") THEN BEGIN
            i := 0;
            WarehouseReceiptLine.RESET;
            WarehouseReceiptLine.SETRANGE("No.", WhseRecpHeader."No.");
            WarehouseReceiptLine.SETRANGE("Source Document", WarehouseReceiptLine."Source Document"::"Inbound Transfer");
            IF WarehouseReceiptLine.FINDSET THEN
                REPEAT
                    i := i + 1;
                UNTIL WarehouseReceiptLine.NEXT = 0;
            IF i >= 2 THEN
                ERROR('There are more than a line');
        END;
    end;
}

