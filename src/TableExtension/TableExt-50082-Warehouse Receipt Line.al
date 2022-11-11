tableextension 50082 Warehouse_receipt_line extends "Warehouse Receipt Line"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,INC-2018-000974

    fields
    {


        Modify("Qty. to Receive")
        {

            trigger OnBeforeValidate()
            begin

                //INC-2018-000974
                PurchaseLine.RESET;
                PurchaseLine.SETRANGE(PurchaseLine."Document No.", "Source No.");
                PurchaseLine.SETRANGE(PurchaseLine."Line No.", "Source Line No.");
                IF PurchaseLine.FINDFIRST THEN BEGIN
                    recItem.GET("Item No.");
                    IF PurchaseLine."PO Qty"=0 THEN
            BEGIN
                        QtyToRec := 0;
                        IF recItem."Tolerance %">0  THEN
                BEGIN
                            IF ("Qty. to Receive" + "Qty. Received" > Quantity) AND ("Qty. to Receive" + "Qty. Received" <= (Quantity + (Quantity * recItem."Tolerance %" / 100))) THEN BEGIN
                                "PO Qty" := Quantity;
                                VALIDATE(Quantity, "Qty. to Receive" + "Qty. Received");
                                PurchaseLine.RESET;
                                PurchaseLine.SETRANGE(PurchaseLine."Document No.", "Source No.");
                                PurchaseLine.SETRANGE(PurchaseLine."Line No.", "Source Line No.");
                                IF PurchaseLine.FINDFIRST THEN
                  BEGIN
                                    PurchaseLine."Tolerance Applied" := TRUE;
                                    RecPurchHeader.RESET;
                                    RecPurchHeader.SETRANGE("No.", PurchaseLine."Document No.");
                                    IF RecPurchHeader.FINDFIRST THEN
                    BEGIN
                                        RecPurchHeader.Status := RecPurchHeader.Status::Open;
                                        RecPurchHeader.MODIFY;
                                        PurchaseLine.VALIDATE(PurchaseLine.Quantity, Quantity);
                                        PurchaseLine."PO Qty" := "PO Qty";
                                        PurchaseLine.MODIFY;
                                    END;
                                    RecPurchHeader.Status := RecPurchHeader.Status::Released;
                                    RecPurchHeader.MODIFY;
                                END;
                            END;
                        END;
                    END;
                END;
                //INC-2018-000974
            end;
        }

        field(50000; "Packing Details"; Text[50])
        {
        }
        field(50002; "PO Qty"; Decimal)
        {
        }


        //Unsupported feature: PropertyChange. Please convert manually.

    }
    trigger OnDelete()
    Begin
        //>>INC-2018-000974
        IF "Source Document" = "Source Document"::"Purchase Order" THEN BEGIN
            PurchaseLine.RESET;
            PurchaseLine.SETRANGE(PurchaseLine."Document No.", "Source No.");
            PurchaseLine.SETRANGE(PurchaseLine."Line No.", "Source Line No.");
            IF PurchaseLine.FINDFIRST THEN BEGIN
                IF PurchaseLine."PO Qty" <> 0 THEN BEGIN
                    PurchHdr.GET(PurchHdr."Document Type"::Order, "Source No.");
                    PurchHdr.Status := PurchHdr.Status::Open;
                    PurchHdr.MODIFY;
                    PurchaseLine.VALIDATE(Quantity, PurchaseLine."PO Qty");
                    PurchaseLine."PO Qty" := 0;
                    PurchaseLine.MODIFY;
                    PurchHdr.Status := PurchHdr.Status::Released;
                    PurchHdr.MODIFY;
                END;
            END;
        END;
        //<<INC-2018-000974
    End;

    var
        "gitl suman": Integer;
        PurchaseLine: Record 39;
        RecPurchHeader: Record 38;
        recItem: Record 27;
        QtyToRec: Decimal;
        PurchHdr: Record 38;
}

