page 50142 "PO Details"
{
    PageType = List;
    Permissions = TableData 39 = rimd;
    SourceTable = 39;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; rec."Document Type")
                {
                }
                field("Buy-from Vendor No."; rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        //IF PH.GET(rec."Document Type", rec."Document No.") THEN
                        //  VendName := PH."Buy-from Vendor Name";
                    end;
                }
                /*field("Vendor Name"; VendName)
                {
                }*/
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; rec."No.")
                {
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Posting Group"; rec."Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Expected Receipt Date"; rec."Expected Receipt Date")
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Outstanding Quantity"; rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                }
                field("Qty. to Invoice"; rec."Qty. to Invoice")
                {
                    ApplicationArea = All;
                }
                field("Qty. to Receive"; rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                }
                field("Direct Unit Cost"; rec."Direct Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost (LCY)"; rec."Unit Cost (LCY)")
                {
                    ApplicationArea = All;
                }
                field("VAT %"; rec."VAT %")
                {
                    ApplicationArea = All;
                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    ApplicationArea = All;
                }
                field("Line Discount Amount"; rec."Line Discount Amount")
                {
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
                field("Unit Price (LCY)"; rec."Unit Price (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Allow Invoice Disc."; rec."Allow Invoice Disc.")
                {
                    ApplicationArea = All;
                }
                field("Gross Weight"; rec."Gross Weight")
                {
                    ApplicationArea = All;
                }
                field("Net Weight"; rec."Net Weight")
                {
                    ApplicationArea = All;
                }
                field("Units per Parcel"; rec."Units per Parcel")
                {
                }
                field("Unit Volume"; rec."Unit Volume")
                {
                    ApplicationArea = All;
                }
                field("Appl.-to Item Entry"; rec."Appl.-to Item Entry")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Indirect Cost %"; rec."Indirect Cost %")
                {
                    ApplicationArea = All;
                }
                field("Recalculate Invoice Disc."; rec."Recalculate Invoice Disc.")
                {
                    ApplicationArea = All;
                }
                field("Outstanding Amount"; rec."Outstanding Amount")
                {
                    ApplicationArea = All;
                }
                field("Qty. Rcd. Not Invoiced"; rec."Qty. Rcd. Not Invoiced")
                {
                    ApplicationArea = All;
                }
                field("Amt. Rcd. Not Invoiced"; rec."Amt. Rcd. Not Invoiced")
                {
                    ApplicationArea = All;
                }
                field("Quantity Received"; rec."Quantity Received")
                {
                    ApplicationArea = All;
                }
                field("Quantity Invoiced"; rec."Quantity Invoiced")
                {
                    ApplicationArea = All;
                }
                field("Receipt No."; rec."Receipt No.")
                {
                    ApplicationArea = All;
                }
                field("Receipt Line No."; rec."Receipt Line No.")
                {
                    ApplicationArea = All;
                }
                field("Profit %"; rec."Profit %")
                {
                    ApplicationArea = All;
                }
                field("Pay-to Vendor No."; rec."Pay-to Vendor No.")
                {
                }
                field("Inv. Discount Amount"; rec."Inv. Discount Amount")
                {
                    ApplicationArea = All;
                }
                field("Vendor Item No."; rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; rec."Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order Line No."; rec."Sales Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Drop Shipment"; rec."Drop Shipment")
                {
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Calculation Type"; rec."VAT Calculation Type")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Transport Method"; rec."Transport Method")
                {
                    ApplicationArea = All;
                }
                field("Attached to Line No."; rec."Attached to Line No.")
                {
                    ApplicationArea = All;
                }
                field("Entry Point"; rec."Entry Point")
                {
                    ApplicationArea = All;
                }
                /*field(Area;Area)
                {
                }*/
                field("Transaction Specification"; rec."Transaction Specification")
                {
                    ApplicationArea = All;
                }
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = All;
                }
                field("Tax Liable"; rec."Tax Liable")
                {
                }
                field("Tax Group Code"; rec."Tax Group Code")
                {
                    ApplicationArea = All;
                }
                field("Use Tax"; rec."Use Tax")
                {
                    ApplicationArea = All;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Outstanding Amount (LCY)"; rec."Outstanding Amount (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Amt. Rcd. Not Invoiced (LCY)"; rec."Amt. Rcd. Not Invoiced (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Reserved Quantity"; rec."Reserved Quantity")
                {
                    ApplicationArea = All;
                }
                field("Blanket Order No."; rec."Blanket Order No.")
                {
                    ApplicationArea = All;
                }
                field("Blanket Order Line No."; rec."Blanket Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("VAT Base Amount"; rec."VAT Base Amount")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("System-Created Entry"; rec."System-Created Entry")
                {
                    ApplicationArea = All;
                }
                field("Line Amount"; rec."Line Amount")
                {
                    ApplicationArea = All;
                }
                field("VAT Difference"; rec."VAT Difference")
                {
                    ApplicationArea = All;
                }
                field("Inv. Disc. Amount to Invoice"; rec."Inv. Disc. Amount to Invoice")
                {
                    ApplicationArea = All;
                }
                field("VAT Identifier"; rec."VAT Identifier")
                {
                    ApplicationArea = All;
                }
                field("IC Partner Ref. Type"; rec."IC Partner Ref. Type")
                {
                    ApplicationArea = All;
                }
                field("IC Partner Reference"; rec."IC Partner Reference")
                {
                    ApplicationArea = All;
                }
                field("Prepayment %"; rec."Prepayment %")
                {
                }
                field("Prepmt. Line Amount"; rec."Prepmt. Line Amount")
                {
                }
                field("Prepmt. Amt. Inv."; rec."Prepmt. Amt. Inv.")
                {
                }
                field("Prepmt. Amt. Incl. VAT"; rec."Prepmt. Amt. Incl. VAT")
                {
                }
                field("Prepayment Amount"; rec."Prepayment Amount")
                {
                }
                field("Prepmt. VAT Base Amt."; rec."Prepmt. VAT Base Amt.")
                {
                }
                field("Prepayment VAT %"; rec."Prepayment VAT %")
                {
                }
                field("Prepmt. VAT Calc. Type"; rec."Prepmt. VAT Calc. Type")
                {
                }
                field("Prepayment VAT Identifier"; rec."Prepayment VAT Identifier")
                {
                }
                field("Prepayment Tax Area Code"; rec."Prepayment Tax Area Code")
                {
                }
                field("Prepayment Tax Liable"; rec."Prepayment Tax Liable")
                {
                }
                field("Prepayment Tax Group Code"; rec."Prepayment Tax Group Code")
                {
                }
                field("Prepmt Amt to Deduct"; rec."Prepmt Amt to Deduct")
                {
                }
                /*field("Prepmt Amt Deducted";"Prepmt Amt Deducted")
                {
                }
                field("Prepayment Line";"Prepayment Line")
                {
                }
                field("Prepmt. Amount Inv. Incl. VAT";"Prepmt. Amount Inv. Incl. VAT")
                {
                }
                field("Prepmt. Amount Inv. (LCY)";"Prepmt. Amount Inv. (LCY)")
                {
                }
                field("IC Partner Code";"IC Partner Code")
                {
                }
                field("Prepmt. VAT Amount Inv. (LCY)";"Prepmt. VAT Amount Inv. (LCY)")
                {
                }
                field("Prepayment VAT Difference";"Prepayment VAT Difference")
                {
                }
                field("Prepmt VAT Diff. to Deduct";"Prepmt VAT Diff. to Deduct")
                {
                }
                field("Prepmt VAT Diff. Deducted";"Prepmt VAT Diff. Deducted")
                {
                }
                field("Outstanding Amt. Ex. VAT (LCY)";"Outstanding Amt. Ex. VAT (LCY)")
                {
                }
                field("A. Rcd. Not Inv. Ex. VAT (LCY)";"A. Rcd. Not Inv. Ex. VAT (LCY)")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Job Task No.";"Job Task No.")
                {
                }
                field("Job Line Type";"Job Line Type")
                {
                }
                field("Job Unit Price";"Job Unit Price")
                {
                }
                field("Job Total Price";"Job Total Price")
                {
                }
                field("Job Line Amount";"Job Line Amount")
                {
                }
                field("Job Line Discount Amount";"Job Line Discount Amount")
                {
                }
                field("Job Line Discount %";"Job Line Discount %")
                {
                }
                field("Job Unit Price (LCY)";"Job Unit Price (LCY)")
                {
                }
                field("Job Total Price (LCY)";"Job Total Price (LCY)")
                {
                }
                field("Job Line Amount (LCY)";"Job Line Amount (LCY)")
                {
                }
                field("Job Line Disc. Amount (LCY)";"Job Line Disc. Amount (LCY)")
                {
                }
                field("Job Currency Factor";"Job Currency Factor")
                {
                }
                field("Job Currency Code";"Job Currency Code")
                {
                }
                field("Job Planning Line No.";"Job Planning Line No.")
                {
                }
                field("Job Remaining Qty.";"Job Remaining Qty.")
                {
                }
                field("Job Remaining Qty. (Base)";"Job Remaining Qty. (Base)")
                {
                }
                field("Deferral Code";"Deferral Code")
                {
                }
                field("Returns Deferral Start Date";"Returns Deferral Start Date")
                {
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Quantity (Base)";"Quantity (Base)")
                {
                }
                field("Outstanding Qty. (Base)";"Outstanding Qty. (Base)")
                {
                }
                field("Qty. to Invoice (Base)";"Qty. to Invoice (Base)")
                {
                }
                field("Qty. to Receive (Base)";"Qty. to Receive (Base)")
                {
                }
                field("Qty. Rcd. Not Invoiced (Base)";"Qty. Rcd. Not Invoiced (Base)")
                {
                }
                field("Qty. Received (Base)";"Qty. Received (Base)")
                {
                }
                field("Qty. Invoiced (Base)";"Qty. Invoiced (Base)")
                {
                }
                field("Reserved Qty. (Base)";"Reserved Qty. (Base)")
                {
                }
                field("FA Posting Date";"FA Posting Date")
                {
                }
                field("FA Posting Type";"FA Posting Type")
                {
                }
                field("Depreciation Book Code";"Depreciation Book Code")
                {
                }
                field("Salvage Value";"Salvage Value")
                {
                }
                field("Depr. until FA Posting Date";"Depr. until FA Posting Date")
                {
                }
                field("Depr. Acquisition Cost";"Depr. Acquisition Cost")
                {
                }
                field("Maintenance Code";"Maintenance Code")
                {
                }
                field("Insurance No.";"Insurance No.")
                {
                }
                field("Budgeted FA No.";"Budgeted FA No.")
                {
                }
                field("Duplicate in Depreciation Book";"Duplicate in Depreciation Book")
                {
                }
                field("Use Duplication List";"Use Duplication List")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                }
                field("Unit of Measure (Cross Ref.)";"Unit of Measure (Cross Ref.)")
                {
                }
                field("Cross-Reference Type";"Cross-Reference Type")
                {
                }
                field("Cross-Reference Type No.";"Cross-Reference Type No.")
                {
                }
                field("Item Category Code";"Item Category Code")
                {
                }
                field(Nonstock;Nonstock)
                {
                }
                field("Purchasing Code";"Purchasing Code")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Special Order";"Special Order")
                {
                }
                field("Special Order Sales No.";"Special Order Sales No.")
                {
                }
                field("Special Order Sales Line No.";"Special Order Sales Line No.")
                {
                }
                field("Whse. Outstanding Qty. (Base)";"Whse. Outstanding Qty. (Base)")
                {
                }
                field("Completely Received";"Completely Received")
                {
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                }
                field("Promised Receipt Date";"Promised Receipt Date")
                {
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                }
                field("Inbound Whse. Handling Time";"Inbound Whse. Handling Time")
                {
                }
                field("Planned Receipt Date";"Planned Receipt Date")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Allow Item Charge Assignment";"Allow Item Charge Assignment")
                {
                }
                field("Qty. to Assign";"Qty. to Assign")
                {
                }
                field("Qty. Assigned";"Qty. Assigned")
                {
                }
                field("Return Qty. to Ship";"Return Qty. to Ship")
                {
                }
                field("Return Qty. to Ship (Base)";"Return Qty. to Ship (Base)")
                {
                }
                field("Return Qty. Shipped Not Invd.";"Return Qty. Shipped Not Invd.")
                {
                }
                field("Ret. Qty. Shpd Not Invd.(Base)";"Ret. Qty. Shpd Not Invd.(Base)")
                {
                }
                field("Return Shpd. Not Invd.";"Return Shpd. Not Invd.")
                {
                }
                field("Return Shpd. Not Invd. (LCY)";"Return Shpd. Not Invd. (LCY)")
                {
                }
                field("Return Qty. Shipped";"Return Qty. Shipped")
                {
                }
                field("Return Qty. Shipped (Base)";"Return Qty. Shipped (Base)")
                {
                }
                field("Return Shipment No.";"Return Shipment No.")
                {
                }
                field("Return Shipment Line No.";"Return Shipment Line No.")
                {
                }
                field("Return Reason Code";"Return Reason Code")
                {
                }
                field("Tax %";"Tax %")
                {
                }
                field("Amount Including Tax";"Amount Including Tax")
                {
                }
                field("Form Code";"Form Code")
                {
                }
                field("Form No.";"Form No.")
                {
                }
                field("State Code";"State Code")
                {
                }
                field("Tax Base Amount";"Tax Base Amount")
                {
                }
                field("Excise Bus. Posting Group";"Excise Bus. Posting Group")
                {
                }
                field("Excise Prod. Posting Group";"Excise Prod. Posting Group")
                {
                }
                field("Amount Including Excise";"Amount Including Excise")
                {
                }
                field("Excise Amount";"Excise Amount")
                {
                }
                field("Excise Base Quantity";"Excise Base Quantity")
                {
                }
                field("Tax Amount";"Tax Amount")
                {
                }
                field("Excise Accounting Type";"Excise Accounting Type")
                {
                }
                field("Work Tax Base Amount";"Work Tax Base Amount")
                {
                }
                field("Work Tax %";"Work Tax %")
                {
                }
                field("Work Tax Amount";"Work Tax Amount")
                {
                }
                field("TDS Category";"TDS Category")
                {
                }
                field("Surcharge %";"Surcharge %")
                {
                }
                field("Surcharge Amount";"Surcharge Amount")
                {
                }
                field("Concessional Code";"Concessional Code")
                {
                }
                field("Excise Base Amount";"Excise Base Amount")
                {
                }
                field("TDS Amount";"TDS Amount")
                {
                }
                field("TDS Nature of Deduction";"TDS Nature of Deduction")
                {
                }
                field("Assessee Code";"Assessee Code")
                {
                }
                field("TDS %";"TDS %")
                {
                }
                field("TDS Amount Including Surcharge";"TDS Amount Including Surcharge")
                {
                }
                field("Bal. TDS Including SHE CESS";"Bal. TDS Including SHE CESS")
                {
                }
                field("Nature of Remittance";"Nature of Remittance")
                {
                }
                field("Act Applicable";"Act Applicable")
                {
                }
                field("Country Code";"Country Code")
                {
                }
                field("Capital Item";"Capital Item")
                {
                }
                field("BED Amount";"BED Amount")
                {
                }
                field("AED(GSI) Amount";"AED(GSI) Amount")
                {
                }
                field("SED Amount";"SED Amount")
                {
                }
                field("SAED Amount";"SAED Amount")
                {
                }
                field("CESS Amount";"CESS Amount")
                {
                }
                field("NCCD Amount";"NCCD Amount")
                {
                }
                field("eCess Amount";"eCess Amount")
                {
                }
                field("Amount Added to Excise Base";"Amount Added to Excise Base")
                {
                }
                field("Amount Added to Tax Base";"Amount Added to Tax Base")
                {
                }
                field("Amount Added to Inventory";"Amount Added to Inventory")
                {
                }
                field("Excise Credit Reversal";"Excise Credit Reversal")
                {
                }
                field("Amount To Vendor";"Amount To Vendor")
                {
                }
                field("Charges To Vendor";"Charges To Vendor")
                {
                }
                field("TDS Base Amount";"TDS Base Amount")
                {
                }
                field("Surcharge Base Amount";"Surcharge Base Amount")
                {
                }
                field("TDS Group";"TDS Group")
                {
                }
                field("Work Tax Nature Of Deduction";"Work Tax Nature Of Deduction")
                {
                }
                field("Work Tax Group";"Work Tax Group")
                {
                }
                field("Temp TDS Base";"Temp TDS Base")
                {
                }
                field("SetOff Available";"SetOff Available")
                {
                }
                field(Subcontracting;Subcontracting)
                {
                }
                field(SubConSend;SubConSend)
                {
                }
                field("Delivery Challan Posted";"Delivery Challan Posted")
                {
                }
                field("Qty. to Reject (Rework)";"Qty. to Reject (Rework)")
                {
                }
                field("Qty. Rejected (Rework)";"Qty. Rejected (Rework)")
                {
                }
                field(SendForRework;SendForRework)
                {
                }
                field("Qty. to Reject (C.E.)";"Qty. to Reject (C.E.)")
                {
                }
                field("Qty. to Reject (V.E.)";"Qty. to Reject (V.E.)")
                {
                }
                field("Qty. Rejected (C.E.)";"Qty. Rejected (C.E.)")
                {
                }
                field("Qty. Rejected (V.E.)";"Qty. Rejected (V.E.)")
                {
                }
                field("Deliver Comp. For";"Deliver Comp. For")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(Status;Status)
                {
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                }
                field("Released Production Order";"Released Production Order")
                {
                }
                field(SubConReceive;SubConReceive)
                {
                }
                field("Component Item No.";"Component Item No.")
                {
                }
                field("Service Tax Group";"Service Tax Group")
                {
                }
                field("Service Tax Base";"Service Tax Base")
                {
                }
                field("Service Tax Amount";"Service Tax Amount")
                {
                }
                field("Service Tax Registration No.";"Service Tax Registration No.")
                {
                }
                field("eCESS % on TDS";"eCESS % on TDS")
                {
                }
                field("eCESS on TDS Amount";"eCESS on TDS Amount")
                {
                }
                field("Total TDS Including SHE CESS";"Total TDS Including SHE CESS")
                {
                }
                field("Per Contract";"Per Contract")
                {
                }
                field("Service Tax eCess Amount";"Service Tax eCess Amount")
                {
                }
                field("ADET Amount";"ADET Amount")
                {
                }
                field("AED(TTA) Amount";"AED(TTA) Amount")
                {
                }
                field("ADE Amount";"ADE Amount")
                {
                }
                field("Assessable Value";"Assessable Value")
                {
                }
                field("VAT Type";"VAT Type")
                {
                }
                field("SHE Cess Amount";"SHE Cess Amount")
                {
                }
                field("Service Tax SHE Cess Amount";"Service Tax SHE Cess Amount")
                {
                }
                field("Non ITC Claimable Usage %";"Non ITC Claimable Usage %")
                {
                }
                field("Amount Loaded on Inventory";"Amount Loaded on Inventory")
                {
                }
                field("Input Tax Credit Amount";"Input Tax Credit Amount")
                {
                }
                field("VAT able Purchase Tax Amount";"VAT able Purchase Tax Amount")
                {
                }
                field(Supplementary;Supplementary)
                {
                }
                field("Source Document Type";"Source Document Type")
                {
                }
                field("Source Document No.";"Source Document No.")
                {
                }
                field("ADC VAT Amount";"ADC VAT Amount")
                {
                }
                field("CIF Amount";"CIF Amount")
                {
                }
                field("BCD Amount";"BCD Amount")
                {
                }
                field(CVD;CVD)
                {
                }
                field("Notification Sl. No.";"Notification Sl. No.")
                {
                }
                field("Notification No.";"Notification No.")
                {
                }
                field("CTSH No.";"CTSH No.")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("SHE Cess % On TDS";"SHE Cess % On TDS")
                {
                }
                field("SHE Cess on TDS Amount";"SHE Cess on TDS Amount")
                {
                }
                field("Excise Loading on Inventory";"Excise Loading on Inventory")
                {
                }
                field("Custom eCess Amount";"Custom eCess Amount")
                {
                }
                field("Custom SHECess Amount";"Custom SHECess Amount")
                {
                }
                field("Excise Refund";"Excise Refund")
                {
                }
                field("CWIP G/L Type";"CWIP G/L Type")
                {
                }
                field("Applies-to ID (Delivery)";"Applies-to ID (Delivery)")
                {
                }
                field("Applies-to ID (Receipt)";"Applies-to ID (Receipt)")
                {
                }
                field("Delivery Challan Date";"Delivery Challan Date")
                {
                }
                field("Item Charge Entry";"Item Charge Entry")
                {
                }
                field("Tot. Serv Tax Amount (Intm)";"Tot. Serv Tax Amount (Intm)")
                {
                }
                field("S. Tax Base Amount (Intm)";"S. Tax Base Amount (Intm)")
                {
                }
                field("S. Tax Amount (Intm)";"S. Tax Amount (Intm)")
                {
                }
                field("S. Tax eCess Amount (Intm)";"S. Tax eCess Amount (Intm)")
                {
                }
                field("S. Tax SHE Cess Amount (Intm)";"S. Tax SHE Cess Amount (Intm)")
                {
                }
                field("Amt. Incl. Service Tax (Intm)";"Amt. Incl. Service Tax (Intm)")
                {
                }
                field("Service Tax SBC %";"Service Tax SBC %")
                {
                }
                field("Service Tax SBC Amount";"Service Tax SBC Amount")
                {
                }
                field("Service Tax SBC Amount (Intm)";"Service Tax SBC Amount (Intm)")
                {
                }
                field("KK Cess%";"KK Cess%")
                {
                }
                field("KK Cess Amount";"KK Cess Amount")
                {
                }
                field("KK Cess Amount (Intm)";"KK Cess Amount (Intm)")
                {
                }
                field("GST Credit";"GST Credit")
                {
                }
                field("GST Group Code";"GST Group Code")
                {
                }
                field("GST Group Type";"GST Group Type")
                {
                }
                field("HSN/SAC Code";"HSN/SAC Code")
                {
                }
                field("GST Base Amount";"GST Base Amount")
                {
                }
                field("GST %";"GST %")
                {
                }
                field("Total GST Amount";"Total GST Amount")
                {
                }
                field(Exempted;Exempted)
                {
                }
                field("GST Jurisdiction Type";"GST Jurisdiction Type")
                {
                }
                field("Custom Duty Amount";"Custom Duty Amount")
                {
                }
                field("GST Reverse Charge";"GST Reverse Charge")
                {
                }
                field(test;test)
                {
                }
                field("Closed PO";"Closed PO")
                {
                }
                field("Packing & Forwarding Charges";"Packing & Forwarding Charges")
                {
                }
                field("Freight Charges";"Freight Charges")
                {
                }
                field("Material Requisition";"Material Requisition")
                {
                }
                field("FA Component Category";"FA Component Category")
                {
                }
                field("Indent No.";"Indent No.")
                {
                }
                field("Indent Line No.";"Indent Line No.")
                {
                }
                field("Qty Send to Quality";"Qty Send to Quality")
                {
                }
                field("Qty in Quality";"Qty in Quality")
                {
                }
                field("Qty Accepted";"Qty Accepted")
                {
                }
                field("Qty Rejected";"Qty Rejected")
                {
                }
                field("Quality Check";"Quality Check")
                {
                }
                field("PO Qty";"PO Qty")
                {
                }
                field("Tolerance Applied";"Tolerance Applied")
                {
                }
                field(Unit;Unit)
                {
                }
                field("Packing Size";"Packing Size")
                {
                }
                field("Quotation No";"Quotation No")
                {
                }
                field("Quatation recieved Line No.";"Quatation recieved Line No.")
                {
                }
                field("Duty Group";"Duty Group")
                {
                }
                field("Total Duty Amount";"Total Duty Amount")
                {
                }
                field("Quantity Can Import";"Quantity Can Import")
                {
                }
                field("Import Quantity Value";"Import Quantity Value")
                {
                }
                field("Incentive CIF (INR)";"Incentive CIF (INR)")
                {
                }
                field("Extra Amount (INR)";"Extra Amount (INR)")
                {
                }
                field("Amount Including Duties";"Amount Including Duties")
                {
                }
                field("Max Incentive Value";"Max Incentive Value")
                {
                }
                field("Incentive UOM";"Incentive UOM")
                {
                }
                field("Total Weight";"Total Weight")
                {
                }
                field(SIONType;SIONType)
                {
                }
                field("DFRC No.";"DFRC No.")
                {
                }
                field("Adv. License No.";"Adv. License No.")
                {
                }
                field("EPCG No.";"EPCG No.")
                {
                }
                field("Import Quantity";"Import Quantity")
                {
                }
                field("Incentive CIF (USD)";"Incentive CIF (USD)")
                {
                }
                field("EPCG Duty at Full Rate(USD)";"EPCG Duty at Full Rate(USD)")
                {
                }
                field("EPCG Duty at Reduced Rate(USD)";"EPCG Duty at Reduced Rate(USD)")
                {
                }
                field("EPCG Duty Saved(USD)";"EPCG Duty Saved(USD)")
                {
                }
                field("EPCG Duty at Full Rate(LCY)";"EPCG Duty at Full Rate(LCY)")
                {
                }
                field("EPCG Duty at Reduced Rate(LCY)";"EPCG Duty at Reduced Rate(LCY)")
                {
                }
                field("EPCG Duty Saved(LCY)";"EPCG Duty Saved(LCY)")
                {
                }
                field("Port Receipt Posted";"Port Receipt Posted")
                {
                }
                field("Freight Ins. Amount";"Freight Ins. Amount")
                {
                }
                field("Inv. Amount";"Inv. Amount")
                {
                }
                field("Inv. Amount (LCY)";"Inv. Amount (LCY)")
                {
                }
                field("Item Type";"Item Type")
                {
                }
                field("DEPB No.";"DEPB No.")
                {
                }
                field("DEPB consumed Amount";"DEPB consumed Amount")
                {
                }
                field(FPS;FPS)
                {
                }
                field("Routing No.";"Routing No.")
                {
                }
                field("Operation No.";"Operation No.")
                {
                }
                field("Work Center No.";"Work Center No.")
                {
                }
                field(Finished;Finished)
                {
                }
                field("Prod. Order Line No.";"Prod. Order Line No.")
                {
                }
                field("Overhead Rate";"Overhead Rate")
                {
                }
                field("MPS Order";"MPS Order")
                {
                }
                field("Planning Flexibility";"Planning Flexibility")
                {
                }
                field("Safety Lead Time";"Safety Lead Time")
                {
                }
                field("Routing Reference No.";"Routing Reference No.")
                {
                }
                */
            }
        }

    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF PH.GET(rec."Document Type", rec."Document No.") THEN
            VendName := PH."Buy-from Vendor Name";
    end;

    var
        PH: Record 38;
        VendName: Text[50];
}

