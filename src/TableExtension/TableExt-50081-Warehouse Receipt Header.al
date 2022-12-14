tableextension 50081 WareHouse_recipt_hdr extends "Warehouse Receipt Header"
{
    // version NAVW19.00.00.45778

    fields
    {

        //Unsupported feature: PropertyDeletion on ""Assigned User ID"(Field 3)". Please convert manually.

        field(50001; "Manufacturer E.C.C. No."; Code[20])
        {
            CaptionML = ENU = 'Manufacturer E.C.C. No.',
                        ENN = 'Manufacturer E.C.C. No.';
            Description = 'sanjay 07/July/2015';
            //TableRelation = "E.C.C. Nos.".Code;
        }
        field(50002; "Manufacturer Name"; Text[100])
        {
            CaptionML = ENU = 'Manufacturer Name',
                        ENN = 'Manufacturer Name';
            Description = 'sanjay 07/July/2015';
        }
        field(50003; "Manufacturer Address"; Text[200])
        {
            CaptionML = ENU = 'Manufacturer Address',
                        ENN = 'Manufacturer Address';
            Description = 'sanjay 07/July/2015';
        }

        field(50006; Desctripation; Text[100])
        {
            CalcFormula = Lookup("Warehouse Receipt Line".Description WHERE("No." = FIELD("No.")));
            Description = 'sanjay 19/08/2015';
            FieldClass = FlowField;
        }
        field(50007; Itemcode; Text[30])
        {
            CalcFormula = Lookup("Warehouse Receipt Line"."Item No." WHERE("No." = FIELD("No.")));
            Description = 'sanjay 19/08/2015';
            FieldClass = FlowField;
        }

    }
    trigger OnAfterDelete()
    Begin
        //>>INC-2018-000974
        //PCPL/NSW/MIG  22July22
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", "No.");
        IF WhseRcptLine.FindFirst() then;
        //PCPL/NSW/MIG  22July22
        IF WhseRcptLine."Source Document" = WhseRcptLine."Source Document"::"Purchase Order" THEN BEGIN
            PurchaseLine.RESET;
            PurchaseLine.SETRANGE(PurchaseLine."Document No.", WhseRcptLine."Source No.");
            PurchaseLine.SETRANGE(PurchaseLine."Line No.", WhseRcptLine."Source Line No.");
            IF PurchaseLine.FINDFIRST THEN BEGIN
                IF PurchaseLine."PO Qty" <> 0 THEN BEGIN
                    PurchHdr.GET(PurchHdr."Document Type"::Order, WhseRcptLine."Source No.");
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
        WhseRcptLine: Record "Warehouse Receipt Line";
        PurchaseLine: Record 39;
        PurchHdr: Record 38;

}

