tableextension 50029 Item_Journal_Line_Ext extends "Item Journal Line"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484,PCPL/QC/V3/001,PCPL-FA-1.0

    fields
    {
        field(50000; "JW Delivery Challan No"; Code[20])
        {
            Description = 'PCPL1.0';
            TableRelation = "Transfer Shipment Line"."JW Delivery Challan" WHERE("Transfer-to Code" = FIELD("Location Code"),
                                                                                  "Item No." = FIELD("Item No."),
                                                                                  "JW Delivery Challan" = FILTER(<> ''));
        }
        field(50001; "Annexure 4(5) No."; Code[20])
        {
            Description = 'PCPL1.0';
            TableRelation = "Transfer Shipment Header"."No." WHERE("Transfer-from Code" = FILTER('CHIPLUN'));
        }
        field(50033; "Manufacturing Date"; Date)
        {
            Description = 'PCPL/BRB';
        }

        field(50080; "Applies to Entry Posting Date"; Date)
        {
            Description = 'PCPL';
            Editable = false;
        }
        field(50081; "Applied to Entry Lot No."; Code[20])
        {
            Description = 'PCPL';
            Editable = false;
        }
        field(50082; "Lot Info"; Code[35])
        {
            Description = 'PCPL 38';
        }
        field(50102; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            Description = 'PCPL/EXIM 3.00.1';
            TableRelation = "Production Order"."No." WHERE(Status = CONST(Released));

            trigger OnValidate();
            begin

                IF "Prod. Order No." = '' THEN BEGIN
                    CreateProdDim();  //Gunjan
                                      // Gunjan-Start
                                      /*
                                      CreateProdDim(
                                         DATABASE::"Production Order","Prod. Order No.",
                                         DATABASE::"Prod. Order Line",FORMAT("Prod. Order Line No."),
                                         DATABASE::"Prod. Order Component",FORMAT("Prod. Order Comp. Line No."));
                                         */
                                      //Gunjan-End
                    EXIT;
                END;

                GetMfgSetup;
                IF MfgSetup."Doc. No. Is Prod. Order No." THEN
                    "Document No." := "Prod. Order No.";
                ProdOrder.GET(ProdOrder.Status::Released, "Prod. Order No.");
                ProdOrder.TESTFIELD(Blocked, FALSE);
                Description := ProdOrder.Description;

                "Gen. Bus. Posting Group" := '';
                CASE TRUE OF
                    "Entry Type" = "Entry Type"::Output:
                        BEGIN
                            "Inventory Posting Group" := ProdOrder."Inventory Posting Group";
                            "Gen. Prod. Posting Group" := ProdOrder."Gen. Prod. Posting Group";
                        END;
                    "Entry Type" = "Entry Type"::Consumption:
                        BEGIN
                            SetFilterProdOrderLine;

                            ProdOrderLine.FIND('-');
                            IF ProdOrderLine.COUNT = 1 THEN
                                VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                        END;
                END;

                IF "Prod. Order No." <> xRec."Prod. Order No." THEN
                    CreateProdDim();    //Gunjan
                                        //Gunjan-Start
                                        /*
                                       CreateProdDim(
                                        DATABASE::"Production Order","Prod. Order No.",
                                        DATABASE::"Prod. Order Line",FORMAT("Prod. Order Line No."),
                                        DATABASE::"Prod. Order Component",FORMAT("Prod. Order Comp. Line No."));
                                        */
                                        //Gunjan-End

                // CreateProdDim;

            end;
        }
        field(50103; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            Description = 'PCPL/EXIM 3.00.1';
            TableRelation = "Prod. Order Line"."Line No." WHERE(Status = CONST(Released),
                                                                 "Prod. Order No." = FIELD("Prod. Order No."));

            trigger OnValidate();
            begin
                SetFilterProdOrderLine;
                ProdOrderLine.SETRANGE("Line No.", "Prod. Order Line No.");
                IF ProdOrderLine.FIND('-') THEN BEGIN
                    "Source Type" := "Source Type"::Item;
                    "Source No." := ProdOrderLine."Item No.";
                    "Prod. Order Line No." := ProdOrderLine."Line No.";
                END;

                IF "Prod. Order Line No." <> xRec."Prod. Order Line No." THEN
                    CreateProdDim(); //Gunjan
                                     //Gunjan-Start
                                     /*
                                      CreateProdDim(
                                    DATABASE::"Production Order","Prod. Order No.",
                                    DATABASE::"Prod. Order Line",FORMAT("Prod. Order Line No."),
                                    DATABASE::"Prod. Order Component",FORMAT("Prod. Order Comp. Line No."));
                                     */
                                     //Gunjan-End

            end;
        }

        field(50108; "Job Card Ref."; Code[30])
        {
            Description = '//PCPL FA';
        }

    }

    //Unsupported feature: PropertyChange. Please convert manually.

    //<<PCPL/NSW/MIG 11July22 New function Add
    local procedure GetMfgSetup()
    begin
        if not MfgSetupRead then
            MfgSetup.Get();
        MfgSetupRead := true;
    end;
    //>>PCPL/NSW/MIG 11July22

    procedure SetFilterProdOrderLine()
    begin
        ProdOrderLine.RESET;
        ProdOrderLine.SETCURRENTKEY(Status, "Prod. Order No.", "Item No.");
        ProdOrderLine.SETRANGE(Status, ProdOrderLine.Status::Released);
        ProdOrderLine.SETRANGE("Prod. Order No.", "Order No.");
    end;


    var
        ProdOrder: Record 5405;
        MfgSetup: Record "Manufacturing Setup";
        MfgSetupRead: Boolean;
        ProdOrderLine: Record 5406;
        ProdOrderComp: Record 5407;
        ProdOrderRtngLine: Record 5409;
        Text012: TextConst ENU = 'The update has been interrupted to respect the warning.', ENN = 'The update has been interrupted to respect the warning.';
}

