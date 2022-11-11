tableextension 50045 tableextension50296 extends "Purchase Line"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484,PCPL/QC/V3/001,INC-2018-000974,//PCPLTDS194Q

    fields
    {



        // modify("CWIP G/L Type")
        // {
        //     CaptionML = ENU='CWIP G/L Type';
        //     OptionCaptionML = ENU=' ,Labor,Material,Overheads';
        // }
        modify("Applies-to ID (Delivery)")
        {
            CaptionML = ENU = 'Applies-to ID (Delivery)';
        }
        modify("Applies-to ID (Receipt)")
        {
            CaptionML = ENU = 'Applies-to ID (Receipt)';
        }
        modify("Delivery Challan Date")
        {
            CaptionML = ENU = 'Delivery Challan Date';
        }

        modify("No.")
        {
            trigger OnAfterValidate()
            var
                recItem: Record 27;
                recSpecs: Record 50015;
            begin
                //PCPL/CUST/QC
                IF Type = Type::Item THEN BEGIN
                    recItem.GET("No.");
                    IF recItem."QC Check" THEN BEGIN
                        recSpecs.GET(recItem."Specs ID");
                        recSpecs.TESTFIELD(recSpecs.Status, recSpecs.Status::Certified);
                    END;
                END;
            end;
        }
        //PCPL/CUST/QC

        modify("Qty. to Receive")
        {
            trigger OnAfterValidate()
            var
                recItem: Record 27;
            begin
                //INC-2018-000974
                IF recItem.GET("No.") THEN BEGIN
                    IF "PO Qty" = 0 THEN BEGIN
                        IF recItem."Tolerance %" > 0 THEN BEGIN
                            IF ("Qty. to Receive" > Quantity) AND ("Qty. to Receive" <= (Quantity + (Quantity * recItem."Tolerance %" / 100))) THEN BEGIN
                                "PO Qty" := "Qty. to Receive";
                                VALIDATE(Quantity, "PO Qty");
                                "Tolerance Applied" := TRUE;
                            END;
                        END;
                    END;
                END;
                //INC-2018-000974
            end;
        }


        field(50000; test; Decimal)
        {
        }
        field(50010; "Packing & Forwarding Charges"; Decimal)
        {
            Description = 'pcpl002410oct2018';
        }
        field(50011; "Freight Charges"; Decimal)
        {
            Description = 'pcpl002410oct2018';
        }
        field(50035; "PO Qty"; Decimal)
        {
            Description = 'INC-2018-000974';
        }
        field(50036; "Tolerance Applied"; Boolean)
        {
            Description = 'INC-2018-000974';
        }
        field(50155; Unit; Text[30])
        {
        }
        field(50156; "Packing Size"; Text[30])
        {
        }
        field(50157; "Quotation No"; Code[20])
        {
            Description = 'pcpl002410oct2018';
        }
        field(50158; "Quatation recieved Line No."; Integer)
        {
            Description = 'pcpl002412Feb2019';
        }

    }


    //Unsupported feature: CodeModification on "OnDelete". Please convert manually.



    var
        Txt001: Label 'You can not have %1 Defined in structure for Import Document';
        recVend: Record 23;
        recVLE: Record 25;
        NONTDSPreviousAmount: Decimal;
        TotalPOAmount: Decimal;
        DataConflictQst: Label 'The change creates a date conflict with existing reservations. Do you want to continue?';
        AssociatedEntErr: Label 'You must select services only for Associated Enterprises.';
        PurchHeaderRec: Record 38;
        IPO: Record 50005;
        recIndent: Record 50003;
        TotalAmountqtyrecieve: Decimal;
        LcRecDepBook: Record 5611;
        Vendor1: Record 23;
    //NODNOCHeader : Record "13786"; //PCPL/NSW/MIG   11july22
    //NODNOCLines : Record "13785";  //PCPL/NSW/MIG   11july22
}

