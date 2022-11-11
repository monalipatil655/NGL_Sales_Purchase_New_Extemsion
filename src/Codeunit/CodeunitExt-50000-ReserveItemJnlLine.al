codeunit 50000 Item_jnl_Line_Reserve
{
    trigger OnRun()
    begin
        //Table - 25,83,7316
        //Codeunit List-12,22,80,134,241,5704,5705
    end;

    procedure CallItemTrackingML(MaintenanceLine: Record "Maintenance Line"; IsReclass: Boolean)
    var
        TrackingSpecification: Record "Tracking Specification";
        ReservEntry: Record "Reservation Entry";
        ItemTrackingForm: Page "Item Tracking Lines";
    begin
        //PCPL-FA-1.0
        MaintenanceLine.TESTFIELD(Component);
        InitTrackingSpecificationML(MaintenanceLine, TrackingSpecification);
        IF IsReclass THEN
            ItemTrackingForm.SetFormRunMode(1);
        ItemTrackingForm.SetSourceSpec(TrackingSpecification, WORKDATE);
        ItemTrackingForm.SetInbound(FALSE);
        ItemTrackingForm.RUNMODAL;
    end;

    procedure InitTrackingSpecificationML(MaintenanceLine: Record "Maintenance Line"; TrackingSpecification: Record "Tracking Specification")
    var
        recItem: Record 27;
    begin
        //PCPL-FA-1.0
        TrackingSpecification.INIT;
        TrackingSpecification."Source Type" := DATABASE::"Maintenance Line";
        WITH MaintenanceLine DO BEGIN
            TrackingSpecification."Item No." := Component;
            TrackingSpecification."Location Code" := "Location Code";
            IF recItem.GET(Component) THEN;
            TrackingSpecification.Description := recItem.Description;
            TrackingSpecification."Variant Code" := '';
            TrackingSpecification."Source Subtype" := 3;
            TrackingSpecification."Source ID" := 'ITEM';
            TrackingSpecification."Source Batch Name" := 'DEFAULT';
            TrackingSpecification."Source Prod. Order Line" := 0;
            TrackingSpecification."Source Ref. No." := "Line No.";
            TrackingSpecification."Quantity (Base)" := Quantity;
            TrackingSpecification."Qty. to Handle" := Quantity;
            TrackingSpecification."Qty. to Handle (Base)" := Quantity;
            TrackingSpecification."Qty. to Invoice" := Quantity;
            TrackingSpecification."Qty. to Invoice (Base)" := Quantity;
            TrackingSpecification."Quantity Handled (Base)" := 0;
            TrackingSpecification."Quantity Invoiced (Base)" := 0;
            TrackingSpecification."Qty. per Unit of Measure" := recItem."Unit Price";
            TrackingSpecification."Bin Code" := "Bin Code";
        END;

    end;

    procedure ApproveApprovalRequestsWeb(VAR ApprovalEntry: Record "Approval Entry"; lUserID: Code[50])
    begin
        //pcpl0024-20dec2018
        IF ApprovalEntry.FINDSET(TRUE) THEN
            REPEAT
                ApproveSelectedApprovalRequestWeb(ApprovalEntry, lUserID);
            UNTIL ApprovalEntry.NEXT = 0;
        //pcpl0024-20dec2018
    end;

    procedure ApproveSelectedApprovalRequestWeb(VAR ApprovalEntry: Record "Approval Entry"; lUserID: Code[50])
    var
        UserSetup: Record 91;
        Apprvalmgt: Codeunit 1535;
    begin
        //pcpl0024-20dec2018
        IF ApprovalEntry.Status <> ApprovalEntry.Status::Open THEN
            ERROR('You can only approve open approval requests.');
        IF ApprovalEntry."Approver ID" <> lUserID THEN begin
            UserSetup.GET(USERID);
            UserSetup.TESTFIELD("Approval Administrator");

        end;
        ApprovalEntry.VALIDATE(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry."Last Date-Time Modified" := CREATEDATETIME(TODAY, TIME);
        ApprovalEntry."Last Modified By User ID" := lUserID;

        ApprovalEntry.MODIFY;
        //OnApproveApprovalRequest(ApprovalEntry);


    end;
    //pcpl0024-20dec2018

    //<<Table Start-25
    [EventSubscriber(ObjectType::Table, database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Payment Terms Code" := GenJournalLine."Payment Terms Code";//PCPL50
    end;
    //>>Table End-25


    //<<Table START-83
    [EventSubscriber(ObjectType::Table, database::"Item Journal Line", 'OnAfterCopyTrackingFromSpec', '', false, false)]
    local procedure OnAfterCopyTrackingFromSpec(var ItemJournalLine: Record "Item Journal Line"; TrackingSpecification: Record "Tracking Specification")
    begin
        ItemJournalLine."Manufacturing Date" := TrackingSpecification."Creation Date"; //PCPL/BRB/22Feb19
    end;
    //>>Table END-83


    //<<Table Start-7316
    [EventSubscriber(ObjectType::Table, database::"Warehouse Receipt Header", 'OnBeforeDeleteWhseRcptRelatedLines', '', false, false)]
    local procedure OnBeforeDeleteWhseRcptRelatedLines(var WhseRcptLine: Record "Warehouse Receipt Line"; var SkipConfirm: Boolean)
    var
        PurchaseLine: record 39;
        PurchHdr: Record 38;
    begin
        //>>INC-2018-000974
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
    end;
    //<<Table End-7316

    //<<Codeunit Start-12
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
    local procedure OnPostBankAccOnBeforeBankAccLedgEntryInsert(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account")
    begin
        BankAccountLedgerEntry."Type of payment" := GenJournalLine."Type of payment";//pcpl0024_FILE GEN
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', false, false)]
    local procedure OnAfterInitGLEntry(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        //001 BEGIN
        //GLEntry."Tax/Charge Group" := GenJournalLine."Tax/Charge Group";
        //GLEntry."Tax/Charge Code" := GenJournalLine."Tax/Charge Code";
        GLEntry."Currency Code" := GenJournalLine."Currency Code";
        GLEntry."Conversion Factor" := GenJournalLine."Currency Factor";
        //GLEntry."DDB No." := GenJournalLine."DDB No.";
        //001 END

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInsertGLEntry', '', false, false)]
    local procedure OnAfterInsertGLEntry(GLEntry: Record "G/L Entry"; GenJnlLine: Record "Gen. Journal Line"; TempGLEntryBuf: Record "G/L Entry" temporary)
    var
        tempno: Code[20];
    begin
        //GITL SA Start
        IF TempNo <> GLEntry."Document No." THEN BEGIN
            //MESSAGE('Posted Voucher No is %1',GLEntry."Document No.");
            TempNo := GLEntry."Document No.";
        END;
        //GITL SA End

    end;
    //>>Codeunit END-12

    //>>Codeunit START-22
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeRunWithCheck', '', false, false)]
    local procedure OnBeforeRunWithCheck(var ItemJournalLine: Record "Item Journal Line"; CalledFromAdjustment: Boolean; CalledFromInvtPutawayPick: Boolean; CalledFromApplicationWorksheet: Boolean; PostponeReservationHandling: Boolean; var IsHandled: Boolean)
    var
        Text00013: Label 'Do you want to Change Posting Date %1 to Work Date %2?';
    begin
        //001
        IF ItemJournalLine."Posting Date" <> WORKDATE THEN BEGIN
            IF CONFIRM(Text00013, TRUE, ItemJournalLine."Posting Date", WORKDATE) THEN BEGIN
                ItemJournalLine.VALIDATE("Posting Date", WORKDATE);
                ItemJournalLine.VALIDATE("Document Date", WORKDATE);
                ItemJournalLine.MODIFY(TRUE);
            END;
        END;
        //001

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Manufacturing Date" := ItemJournalLine."Manufacturing Date";   //PCPl/BRB
        NewItemLedgEntry."Job Card Ref." := ItemJournalLine."Job Card Ref.";   //PCPL FA
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."Job Card Ref." := ItemJournalLine."Job Card Ref.";   //PCPL FA
    end;

    //<<Codeunit END-22

    //>>Codeunit START-80
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeCreateServItemOnSalesInvoice', '', false, false)]
    local procedure OnBeforeCreateServItemOnSalesInvoice(SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        //PCPL/BRB
        IF SalesHeader."Commission Applicable" THEN BEGIN
            SalesHeader.TESTFIELD("Vendor Amount");
            TDSEntryPurchaseJournal(SalesHeader);
        END;
        //PCPL/BRB
    end;
    //<<Codeunit END-80


    //>>Codeunit START-90
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostInvPostBuffer', '', false, false)]
    local procedure OnBeforePostInvPostBuffer(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer"; var PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean; CommitIsSupressed: Boolean; var GenJnlLineDocNo: code[20])
    var
        PurchInvLine: record 123;
        FADepreciationBook: Record "FA Depreciation Book";
        PurchInvHeader: Record 112;
    begin
        //PCPL-FA Start
        IF PurchInvLine.Type = PurchInvLine.Type::"Fixed Asset" THEN BEGIN
            FADepreciationBook.RESET;
            FADepreciationBook.SETRANGE("FA No.", PurchInvLine."No.");
            FADepreciationBook.SETFILTER("Depreciation Starting Date", '%1', 0D);
            IF FADepreciationBook.FINDSET THEN
                REPEAT
                    FADepreciationBook."Depreciation Starting Date" := PurchInvHeader."Posting Date";
                    FADepreciationBook.MODIFY;
                UNTIL FADepreciationBook.NEXT = 0;
            ;
        END;
        //PCPL-FA end
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostInvPostBuffer', '', false, false)]
    local procedure OnAfterPostInvPostBuffer(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer"; PurchHeader: Record "Purchase Header"; GLEntryNo: Integer; CommitIsSupressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    var
        PIH: Record 122;
        PurchInvHeader: Record 122;
        PIL: Record 123;
        FixedAss: Record 5600;
        FASetup1: Record 5603;
        FALedgerEntry: Record 5601;
        cnt: Integer;
        FADepreciationBook: Record 5612;
        FALedEn: record 5601;
        amt: Decimal;
        FACOUNT: Integer;
        FANO: Code[10];

    begin
        //PCPL-FA start
        PIH.RESET;
        PIH.SETRANGE("No.", PurchInvHeader."No.");
        IF PIH.FINDFIRST THEN BEGIN
            PIL.RESET;
            PIL.SETRANGE("Document No.", PIH."No.");
            IF PIL.FINDFIRST THEN
                REPEAT
                    IF PIL.Type = PIL.Type::"Fixed Asset" THEN BEGIN
                        FixedAss.GET(PIL."No.");
                        IF FixedAss."Salvage Value Applicable" THEN BEGIN
                            FASetup1.GET;
                            FASetup1.TESTFIELD("Salvage Value %");
                            FALedgerEntry.RESET;
                            IF FALedgerEntry.FINDLAST THEN
                                cnt := FALedgerEntry."Entry No." + 1;
                            FADepreciationBook.RESET;
                            FADepreciationBook.SETRANGE("FA No.", FixedAss."No.");
                            IF FADepreciationBook.FINDFIRST THEN BEGIN
                                CLEAR(amt);
                                CLEAR(FACOUNT);
                                FALedEn.RESET;
                                FALedEn.SETRANGE(FALedEn."FA No.", FADepreciationBook."FA No.");
                                FALedEn.SETFILTER("Document Type", '%1|%2', FALedEn."Document Type"::Invoice, FALedEn."Document Type"::" ");
                                FALedEn.SETRANGE("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                                FALedEn.SETRANGE("FA Posting Type", FALedEn."FA Posting Type"::"Acquisition Cost");
                                IF FALedEn.FINDFIRST THEN BEGIN
                                    //amt := (FALedEn.Amount*FASetup1."Salvage Value %")/100;
                                    amt := ROUND((FALedEn.Amount * FASetup1."Salvage Value %") / 100, 0.01);      //15nov21
                                END;
                                FALedgerEntry.INIT;
                                FALedgerEntry."Entry No." := cnt;
                                FALedgerEntry.VALIDATE("FA No.", PIL."No.");
                                FALedgerEntry.VALIDATE("Document No.", PIL."Document No.");
                                FALedgerEntry.VALIDATE(FALedgerEntry."FA Posting Date", PIH."Posting Date");
                                FALedgerEntry.VALIDATE("Posting Date", PIH."Posting Date");
                                FALedgerEntry.VALIDATE("Document Date", PIH."Posting Date");
                                FALedgerEntry.VALIDATE("FA Posting Date", PIH."Posting Date");
                                FALedgerEntry.VALIDATE("Depreciation Starting Date", FADepreciationBook."Depreciation Starting Date");
                                FALedgerEntry.VALIDATE(Description, FADepreciationBook.Description);
                                FALedgerEntry.VALIDATE("Depreciation Method", FADepreciationBook."Depreciation Method");
                                FALedgerEntry.VALIDATE("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                                FALedgerEntry.VALIDATE("Part of Book Value", FALSE); //PCPL0017
                                FALedgerEntry.VALIDATE("Part of Depreciable Basis", TRUE); //PCPL0017
                                FALedgerEntry.VALIDATE(Amount, -amt);
                                FALedgerEntry.VALIDATE("FA Posting Type", FALedgerEntry."FA Posting Type"::"Salvage Value");
                                FACOUNT += 1;
                                FANO := FALedgerEntry."FA No.";
                                FALedgerEntry.INSERT;
                            END;
                        END;
                    END;
                UNTIL PIL.NEXT = 0;
            IF (FACOUNT <> 0) THEN
                MESSAGE('Salvage value is post for FA No ' + FANO);
        END;
        //PCPL-FA end
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', false, false)]
    local procedure OnBeforePurchRcptHeaderInsert(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    begin
        // >> Saravanan.P, Karya , 27/06/2014
        // PurchRcptHeader.Freight := Freight;
        // << Saravanan.P, Karya, 27/06/2014
        //for posting date and time capture in receipt sanjay 11/12/2015
        PurchRcptHeader.Postingdatetime := CURRENTDATETIME;

        //for posting date and time capture in receipt sanjay 11/12/2015

        //for posting date and time capture in receipt sanjay 26/07/2016
        PurchRcptHeader.PackingDetails := PurchaseHeader.PackingDetails;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchInvHeaderInsert', '', false, false)]
    local procedure OnBeforePurchInvHeaderInsert(var PurchInvHeader: Record "Purch. Inv. Header"; var PurchHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    begin
        PurchInvHeader.Postingdatetime := CURRENTDATETIME;

        //for posting date and time capture in INVOICE sanjay 11/12/2015
        //for posting packingdetail capture in Invoice sanjay 26/07/2016
        PurchInvHeader.PackingDetails := PurchHeader.PackingDetails;

        //for posting date and time capture in invoice sanjay 26/07/2016

        PurchInvHeader.TESTFIELD("Location Code"); //pcpl-nik
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchCrMemoHeaderInsert', '', false, false)]
    local procedure OnBeforePurchCrMemoHeaderInsert(var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var PurchHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    begin
        //    add by sanjay 29/07/2016 for packing details
        PurchCrMemoHdr.PackingDetails := PurchHeader.PackingDetails;
        //    add by sanjay 29/07/2016 for packing details
    end;
    //<<Codeunit END-90

    //<<Codeunit START-134
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Import Attachment - Inc. Doc.", 'OnAfterImportAttachment', '', false, false)]
    local procedure OnAfterImportAttachment(var IncomingDocumentAttachment: Record "Incoming Document Attachment")
    var
        txtDestinationFilePath: Text[250];
        IncomingDocument: Record 130;
        Name: Text[250];
        FileManagement: Codeunit "File Management";
        FileName: text[250];

    begin
        //PCPL0024_INCDOC
        txtDestinationFilePath := GetPathForFileSaving(IncomingDocument) + Name + '-' + FORMAT(IncomingDocumentAttachment."Incoming Document Entry No.")
                                            + '-' + FORMAT(IncomingDocumentAttachment."Line No.") + '.' + IncomingDocumentAttachment."File Extension";
        //FileManagement.CopyClientFile(FileName, txtDestinationFilePath, FALSE); //PCPL/NSW/07 03Nov22 Function Not Available
        FileManagement.CopyServerFile(FileName, txtDestinationFilePath, false);  //PCPL/NSW/07  03Nov22 New Function Add due to above Function Missing
        IncomingDocumentAttachment."File Path" := txtDestinationFilePath;
        CLEAR(IncomingDocumentAttachment.Content);
        //PCPL0024_INCDOC
    end;
    //>>Codeunit END-134

    //<<Codeunit START-241
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode(var ItemJournalLine: Record "Item Journal Line"; var HideDialog: Boolean; var SuppressCommit: Boolean; var IsHandled: Boolean)
    var
        Text00013: Label 'Do you want to Change Posting Date %1 to Work Date %2?';
    begin
        //001
        IF ItemJournalLine."Posting Date" <> WORKDATE THEN BEGIN
            IF CONFIRM(Text00013, TRUE, ItemJournalLine."Posting Date", WORKDATE) THEN BEGIN
                ItemJournalLine.VALIDATE("Posting Date", WORKDATE);
                ItemJournalLine.VALIDATE("Document Date", WORKDATE);
                ItemJournalLine.MODIFY(TRUE);
            END;
        END;
        //001
    end;
    //>>Codeunit END-241

    // //>>Codeunit START-415
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterReleasePurchaseDoc', '', false, false)]
    // local procedure OnAfterReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var LinesWereModified: Boolean)
    // var
    //     az: Integer;
    //     Recapprovalentry: Record 454;
    //     mailtovendveriable: Integer;
    //     recpurchaseheader: record 38;
    // begin
    //     //pcpl0024--19 april 2019--Statrt
    //     az := 0;
    //     Recapprovalentry.RESET;
    //     Recapprovalentry.SETRANGE(Recapprovalentry."Document No.", PurchaseHeader."No.");
    //     IF Recapprovalentry.FINDSET THEN BEGIN
    //         REPEAT
    //             IF Recapprovalentry.Status = Recapprovalentry.Status::Open THEN
    //                 az := 1;
    //         UNTIL Recapprovalentry.NEXT = 0;
    //     END;


    //     IF az <> 1 THEN //pcpl0024--19 april 2019
    //       BEGIN //pcpl0024--19 april 2019
    //             //ppl0024_20Dec2018
    //         IF (PurchaseHeader.Status = PurchaseHeader.Status::Released) AND (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) THEN BEGIN
    //             IF mailtovendveriable <> 1 THEN
    //                 recpurchaseheader.sendmailtovendor(PurchaseHeader."No.");
    //         END;
    //         //pcpl0024_20Dec2018
    //     END;//pcpl0024--19 april 2019

    // end;
    // //>>Codeunit END-415


    //<<Codeunit START-5704
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnBeforeInsertTransShptHeader', '', false, false)]
    local procedure OnBeforeInsertTransShptHeader(var TransShptHeader: Record "Transfer Shipment Header"; TransHeader: Record "Transfer Header"; CommitIsSuppressed: Boolean)
    begin
        TransShptHeader."JW Delivery Challan" := TransHeader."JW Delivery Challan";   //PCPL-BRB  20220103

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnBeforeInsertTransShptLine', '', false, false)]
    local procedure OnBeforeInsertTransShptLine(var TransShptLine: Record "Transfer Shipment Line"; TransLine: Record "Transfer Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean)
    begin
        //SUBCON1.0
        TransShptLine."JW Delivery Challan" := TransLine."JW Delivery Challan";
        TransShptLine."Annexure 4(5) No." := TransLine."Annexure 4(5) No.";
        //SUBCON1.0
    end;
    //>>Codeunit END-5704

    //<<Codeunit START-5705
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforeTransRcptHeaderInsert', '', false, false)]
    local procedure OnBeforeTransRcptHeaderInsert(var TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferReceiptHeader."JW Delivery Challan" := TransferHeader."JW Delivery Challan";   //PCPL-BRB  20220103
        TransferReceiptHeader.Postingdate_time := CURRENTDATETIME;    //PCPL-BRB 20220120
        TransferReceiptHeader."User ID" := USERID;    //PCPL-BRB-20211129 
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforeInsertTransRcptLine', '', false, false)]
    local procedure OnBeforeInsertTransRcptLine(var TransRcptLine: Record "Transfer Receipt Line"; TransLine: Record "Transfer Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean)
    begin
        //SUBCON1.0
        TransRcptLine."JW Delivery Challan" := TransLine."JW Delivery Challan";
        TransRcptLine."Annexure 4(5) No." := TransLine."Annexure 4(5) No.";

        //SUBCON1.0
    end;
    //>>Codeunit END-5705

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Tracking Data Collection", 'OnCreateEntrySummary2OnAfterAssignTrackingFromReservEntry', '', false, false)]
    local procedure OnCreateEntrySummary2OnAfterAssignTrackingFromReservEntry(var TempGlobalEntrySummary: Record "Entry Summary" temporary; TempReservEntry: Record "Reservation Entry" temporary);
    var
        ILE: Record 32;
    begin
        //KARYA--
        ILE.RESET;
        ILE.SETRANGE(ILE."Item No.", TempReservEntry."Item No.");
        ILE.SETFILTER("Entry Type", '%1|%2|%3|%4', ILE."Entry Type"::Output, ILE."Entry Type"::Purchase, ILE."Entry Type"::"Positive Adjmt.", ILE."Entry Type"::Transfer);
        ILE.SETFILTER("Remaining Quantity", '>0');
        ILE.SETRANGE("Lot No.", TempReservEntry."Lot No.");
        IF ILE.FINDFIRST THEN BEGIN
            ILE.CALCFIELDS("Certificate No");
            TempGlobalEntrySummary."COA No." := ILE."Certificate No";
        END;
        //KARYA++
    end;




    procedure GetPathForFileSaving(IncomingDocument: Record "Incoming Document"): Text[250]
    var
        recIncomingDocSetup: Record "Incoming Documents Setup";
    begin
        //PCPL0024_IncDoc
        recIncomingDocSetup.GET;
        WITH IncomingDocument DO BEGIN
            CASE "Document Type" OF
                "Document Type"::Journal:
                    EXIT(recIncomingDocSetup."Bank Receipt");
                "Document Type"::"Sales Invoice":
                    EXIT(recIncomingDocSetup."Sales Path");
                "Document Type"::"Sales Credit Memo":
                    EXIT(recIncomingDocSetup."Sales Path");
                "Document Type"::"Purchase Invoice":
                    EXIT(recIncomingDocSetup."Purchase Path");
                "Document Type"::"Purchase Credit Memo":
                    EXIT(recIncomingDocSetup."Purchase Path");
                //PCPLTDS194Q
                "Document Type"::Vendor:
                    EXIT(recIncomingDocSetup."Vendor Path");
                "Document Type"::Customer:
                    EXIT(recIncomingDocSetup."Customer Path");
                //PCPLTDS194Q
                //PCPL-25/INCDoc
                "Document Type"::"Indent Header":
                    EXIT(recIncomingDocSetup."Indent Path");
                //PCPL-25/INCDoc

                //PCPL/FinishedProd/INCDoc
                "Document Type"::"Finished Production":
                    EXIT(recIncomingDocSetup."Finished Production Path");

                "Document Type"::"Posted Inspection":
                    EXIT(recIncomingDocSetup."Posted Inspection Path");
            //PCPL/FinishedProd/INCDoc
            END;
        END;
    end;
    //PCPL0024_IncDoc


    Procedure TDSEntryPurchaseJournal(SalesHeader: Record "Sales Header")
    var
        GenJournalLine: record "Gen. Journal Line";
        GeneralLedgerSetup: record "General Ledger Setup";
        GenJournalBatch: record "Gen. Journal Batch";
        NoSeries: Codeunit NoSeriesManagement;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    begin
        GeneralLedgerSetup.GET;
        GenJournalLine.SETRANGE("Journal Template Name", 'PURCHASES');
        GenJournalLine.SETRANGE("Journal Batch Name", 'DEFAULT');
        IF GenJournalLine.FINDLAST THEN
            GenJournalLine."Line No." += 10000
        ELSE
            GenJournalLine."Line No." := 10000;
        GenJournalLine.INIT;
        GenJournalLine."Journal Template Name" := 'PURCHASES';
        GenJournalLine."Journal Batch Name" := 'DEFAULT';
        GenJournalLine."Document No." := NoSeries.GetNextNo('GJNL-PURCH', 0D, TRUE);
        GenJournalLine."Document Type" := GenJournalLine."Document Type"::Invoice;
        GenJournalLine.VALIDATE("External Document No.", SalesHeader."No.");
        GenJournalLine.VALIDATE("Party Type", GenJournalLine."Party Type"::Vendor);
        GenJournalLine.VALIDATE("Party Code", SalesHeader."Vendor No.");
        GenJournalLine."Account Type" := GenJournalLine."Account Type"::Vendor;
        GenJournalLine.VALIDATE("Account No.", SalesHeader."Vendor No.");
        GenJournalLine.VALIDATE("Posting Date", SalesHeader."Posting Date");
        GenJournalLine.VALIDATE("Currency Code", SalesHeader."Currency Code Vendor");

        GenJournalLine.VALIDATE("Credit Amount", SalesHeader."Vendor Amount");
        //GenJournalLine.VALIDATE("Amount (LCY)",SalesHeader."Vendor Amount(LCY)");
        //GenJournalLine.VALIDATE("TDS Nature of Deduction",SalesHeader."TDS Nature of Deduction");  //PCPL/NSW/MIG 02Aug22
        //GenJournalLine.VALIDATE("TDS Category",SalesHeader."TDS Category"); //PCPL/NSW/MIG 02Aug22

        //GenJournalLine."TDS Nature of Deduction" :=SalesHeader."TDS Nature of Deduction";

        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", SalesHeader."Shortcut Dimension 1 Code");
        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", SalesHeader."Shortcut Dimension 2 Code");
        GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
        GenJournalLine.VALIDATE("Bal. Account No.", GeneralLedgerSetup."Bal. Account No");
        GenJournalLine.INSERT;
        //GenJnlPostLine.RunWithCheck(GenJournalLine);    //PCPL/BRB-Don't need
    end;

}