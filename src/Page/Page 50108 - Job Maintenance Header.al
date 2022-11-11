page 50108 "Job Maintenance Header"
{
    // version PCPL-FA-1.0

    PageType = Card;
    SourceTable = 50035;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = ALL;

                }
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = ALL;

                }
                field("FA Description"; rec."FA Description")
                {
                    ApplicationArea = ALL;

                }
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = ALL;

                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = ALL;

                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = ALL;

                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = ALL;

                }
                field("Created By"; rec."Created By")
                {
                    ApplicationArea = ALL;

                }
                field(Status; rec.Status)
                {
                    ApplicationArea = ALL;

                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = ALL;

                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = ALL;

                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    ApplicationArea = ALL;

                }
                field("Prod.main. Date"; rec."Prod.main. Date")
                {
                    ApplicationArea = ALL;

                }
                field("Approver ID"; rec."Approver ID")
                {
                    ApplicationArea = ALL;

                }
                field(Approval; rec.Approval)
                {
                    Editable = EditField;
                    ApplicationArea = ALL;

                }
                field("Maintenance Type"; rec."Maintenance Type")
                {
                    OptionCaption = '< Preventive Maintenance,Miscellaneouse Job,Statutory Compliance Job,AMC Job,Break Down,Calibration>';
                    ApplicationArea = ALL;

                }
                field("PO Document No."; rec."PO Document No.")
                {
                    ApplicationArea = ALL;

                }
            }
            part(MaintenanceSubPage; 50109)
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            part(MaintenanceSubPage1; 50095)
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            part(MaintenanceSubPage2; 50096)
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Line")
            {
                Visible = false;

                trigger OnAction();
                begin
                    rec.TESTFIELD("Location Code");
                    IF recFA.GET(rec."FA No.") THEN BEGIN
                        rec."FA Description" := recFA.Description;
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", rec."No.");
                        IF MaintenanceLine.FINDFIRST THEN
                            MaintenanceLine.DELETEALL;
                        CLEAR(vLine);
                        ComponentList.RESET;
                        ComponentList.SETRANGE("FA No.", rec."FA No.");
                        IF ComponentList.FINDFIRST THEN BEGIN
                            REPEAT
                                IF vLine = 0 THEN
                                    vLine := 10000;
                                recML.INIT;
                                recML."Document No." := rec."No.";
                                recML."Line No." := vLine;
                                recML."Component Type" := ComponentList."Component Type";
                                recML.Component := ComponentList.Component;
                                recML.Quantity := ComponentList.Quantity;
                                recML.Description := ComponentList.Description;
                                recML."Location Code" := rec."Location Code";
                                recILE.RESET;
                                recILE.SETRANGE("Location Code", rec."Location Code");
                                recILE.SETRANGE("Item No.", ComponentList.Component);
                                IF recILE.FINDFIRST THEN
                                    REPEAT
                                        recML."Inventory  Qty" += recILE."Remaining Quantity";
                                    UNTIL recILE.NEXT = 0;
                                recML.INSERT;
                                vLine += 10000;
                                COMMIT;
                            UNTIL ComponentList.NEXT = 0;
                        END;
                    END;
                end;
            }
            action("Close Job Card")
            {

                trigger OnAction();
                begin
                    IF rec.Status = rec.Status::Created THEN BEGIN
                        rec.Status := rec.Status::"Under Maintenance";
                        rec.MODIFY;
                    END;

                    IF rec.Status = rec.Status::"Under Maintenance" THEN BEGIN
                        CurrPage.EDITABLE(FALSE);
                        CurrPage.MaintenanceSubPage.PAGE.EDITABLE(FALSE);
                    END;
                end;
            }
            action(Post)
            {

                trigger OnAction();
                begin
                    //TESTFIELD(Status,Status::"Under Maintenance"); //PCPL0017 Not Needed
                    MaintenanceLine.RESET;
                    MaintenanceLine.SETRANGE("Document No.", rec."No.");
                    MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                    IF MaintenanceLine.FINDFIRST THEN
                        REPEAT
                            //IF MaintenanceLine."Inventory  Qty"<=0 THEN //Previous
                            IF MaintenanceLine."Inventory  Qty" > MaintenanceLine.Quantity THEN //PCPL0017 New
                                ERROR('Inventory  Quantity is 0 for Item %1', MaintenanceLine.Component);
                        UNTIL MaintenanceLine.NEXT = 0;

                    CLEAR(vLine);
                    MaintenanceLine.RESET;
                    MaintenanceLine.SETRANGE("Document No.", rec."No.");
                    MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                    IF MaintenanceLine.FINDFIRST THEN
                        REPEAT
                            IF vLine = 0 THEN
                                vLine := 10000;
                            ItemJournalLine.RESET;
                            ItemJournalLine.INIT;
                            ItemJournalLine."Journal Batch Name" := 'DEFAULT';
                            ItemJournalLine."Journal Template Name" := 'ITEM';
                            ItemJnlTemplate.GET('ITEM');
                            ItemJnlBatch.GET('ITEM', 'DEFAULT');
                            ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Negative Adjmt.";
                            ItemJournalLine."Document Date" := WORKDATE;
                            IF ItemJnlBatch."No. Series" <> '' THEN BEGIN
                                CLEAR(NoSeriesMgt);
                                ItemJournalLine."Document No." := NoSeriesMgt.GetNextNo(ItemJnlBatch."No. Series", TODAY, FALSE);
                            END;
                            ItemJournalLine."Line No." := vLine;
                            ItemJournalLine."Posting Date" := TODAY;
                            ItemJournalLine."Item No." := MaintenanceLine.Component;
                            ItemJournalLine.VALIDATE(ItemJournalLine.Quantity, MaintenanceLine.Quantity);
                            ItemJournalLine."Location Code" := MaintenanceLine."Location Code";
                            ItemJournalLine."Bin Code" := MaintenanceLine."Bin Code";
                            recItem.GET(MaintenanceLine.Component);
                            ItemJournalLine.Description := recItem.Description;
                            ItemJournalLine."Unit of Measure Code" := recItem."Base Unit of Measure";
                            ItemJournalLine."Gen. Prod. Posting Group" := recItem."Gen. Prod. Posting Group";
                            ItemJournalLine."Job Card Ref." := rec."No.";
                            ItemJournalLine.INSERT;
                            vLine += 10000;
                        UNTIL MaintenanceLine.NEXT = 0;
                    //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJournalLine);
                    MESSAGE('Item Journal Line has been created');
                end;
            }
            action("Create PO")
            {
                Visible = false;

                trigger OnAction();
                begin
                    rec.TESTFIELD("Vendor No.");
                    rec.TESTFIELD("PO Document No.", '');
                    rec.TESTFIELD("Location Code"); //PCPL0017
                    MaintenanceLine.RESET;
                    MaintenanceLine.SETRANGE("Document No.", rec."No.");
                    MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::"G/L Account");
                    IF NOT MaintenanceLine.FINDFIRST THEN
                        ERROR('No GL lines in Job Card')
                    ELSE BEGIN
                        PurchaseHeader.INIT;
                        PurchSetup.GET;
                        //PurchaseHeader."No.":=NoSeriesMgt.GetNextNo(PurchSetup."Order Nos.",TODAY,FALSE);
                        NoSeriesMgt.InitSeries(PurchSetup."Order Nos.", PurchSetup."Order Nos.", TODAY, PurchaseHeader."No.", PurchSetup."Order Nos.");
                        PurchaseHeader.VALIDATE("Document Type", PurchaseHeader."Document Type"::Order);
                        PurchaseHeader.VALIDATE("Buy-from Vendor No.", rec."Vendor No.");
                        PurchaseHeader.VALIDATE("Location Code", rec."Location Code");
                        PurchaseHeader.VALIDATE("Posting Date", TODAY);
                        PurchaseHeader.INSERT;
                        CLEAR(vLine);
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", rec."No.");
                        MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::"G/L Account");
                        IF MaintenanceLine.FINDFIRST THEN
                            REPEAT
                                PurchaseLine.RESET;
                                PurchaseLine.SETRANGE("Document Type", PurchaseHeader."Document Type");
                                PurchaseLine.SETRANGE("Document No.", PurchaseHeader."No.");
                                IF PurchaseLine.FINDLAST THEN
                                    vLine := PurchaseLine."Line No." + 10000
                                ELSE
                                    vLine := 10000;
                                PurchaseLine.INIT;
                                PurchaseLine."Document No." := PurchaseHeader."No.";
                                PurchaseLine.VALIDATE("Document Type", PurchaseHeader."Document Type");
                                PurchaseLine."Line No." := vLine;
                                PurchaseLine.VALIDATE(Type, PurchaseLine.Type::"G/L Account");
                                PurchaseLine.VALIDATE("No.", MaintenanceLine.Component);
                                PurchaseLine.VALIDATE(Quantity, MaintenanceLine.Quantity);
                                PurchaseLine.INSERT;
                                vLine += 10000;
                            UNTIL MaintenanceLine.NEXT = 0;
                        rec."PO Document No." := PurchaseHeader."No.";
                    END;
                    MESSAGE('PO Created');
                end;
            }
            action("Create Requsition")
            {

                trigger OnAction();
                begin
                    rec.TESTFIELD("Location Code");//PCPL0017
                    MaintenanceLine.RESET;
                    MaintenanceLine.SETRANGE("Document No.", rec."No.");
                    MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                    IF MaintenanceLine.FINDFIRST THEN
                        REPEAT
                            MaintenanceLine.CALCFIELDS("Inventory  Qty");
                            IF MaintenanceLine.Quantity <= MaintenanceLine."Inventory  Qty" THEN
                                ERROR('Inventory is already available. Please create Indent only if it is needed');//PCPL0017
                        UNTIL MaintenanceLine.NEXT = 0;
                    CLEAR(ReqCreated);
                    MaintenanceLine.RESET;
                    MaintenanceLine.SETRANGE("Document No.", rec."No.");
                    MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                    MaintenanceLine.SETRANGE("Req no.", '');
                    IF NOT MaintenanceLine.FINDFIRST THEN
                        ERROR('No Item lines in Job Card or Indent already created')
                    ELSE BEGIN
                        RequisitionHeader.INIT;
                        PurchSetup.GET;
                        //RequisitionHeader."Requisition No":=NoSeriesMgt.GetNextNo(PurchSetup."Requisition No Series",TODAY,FALSE);
                        //NoSeriesMgt.InitSeries(PurchSetup."Requisition No Series",PurchSetup."Requisition No Series",TODAY,RequisitionHeader."Requisition No",PurchSetup."Requisition No Series");
                        NoSeriesMgt.InitSeries(PurchSetup."Indent No.1", PurchSetup."Indent No.1", TODAY, RequisitionHeader."No.", PurchSetup."Indent No.1");
                        RequisitionHeader.VALIDATE(Date, TODAY);//PCPL0017
                        RequisitionHeader.VALIDATE("Creation Date", TODAY);
                        RequisitionHeader.VALIDATE(Status, RequisitionHeader.Status::Open);
                        //RequisitionHeader.VALIDATE("Job Reference","No.");//PCPL0017
                        RequisitionHeader.VALIDATE("Job Maintenance No.", rec."No.");    //PCPL-25
                        RequisitionHeader.VALIDATE("Location Code", rec."Location Code");//PCPL0017
                                                                                         //RequisitionHeader.VALIDATE("Final Version",TRUE);  COMMIT;
                        RequisitionHeader.INSERT;
                        COMMIT;
                        ReqCreated := TRUE;
                        CLEAR(vLine);
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", rec."No.");
                        MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                        MaintenanceLine.SETFILTER("Req no.", '');
                        IF MaintenanceLine.FINDFIRST THEN
                            REPEAT
                                IF ReqCreated THEN BEGIN
                                    RequisitionLine.RESET;
                                    RequisitionLine.SETRANGE("Document No.", RequisitionHeader."No.");
                                    IF RequisitionLine.FINDLAST THEN
                                        vLine := RequisitionLine."Line No." + 10000
                                    ELSE
                                        vLine := 10000;
                                    RequisitionLine.INIT;
                                    RequisitionLine."Document No." := RequisitionHeader."No.";
                                    RequisitionLine."Line No." := vLine;
                                    RequisitionLine.VALIDATE(Type, RequisitionLine.Type::Item);
                                    RequisitionLine.VALIDATE("No.", MaintenanceLine.Component);
                                    RequisitionLine.VALIDATE(Quantity, MaintenanceLine.Quantity);
                                    //RequisitionLine.VALIDATE("Job Reference No.","No.");
                                    RequisitionLine.VALIDATE("Job Maintenance No.", rec."No.");    //PCPL-25
                                    RequisitionLine.VALIDATE("Location Code", rec."Location Code");//PCPL0017
                                    RequisitionLine.VALIDATE("Variant Code", MaintenanceLine."Variant Code");  //PCPL-25
                                                                                                               //RequisitionLine.VALIDATE("Bin Code","Bin Code");//PCPL0017
                                    RequisitionLine.INSERT;
                                    //vLine+=10000;
                                    MaintenanceLine."Req no." := RequisitionLine."Document No.";
                                    MaintenanceLine."Req Line no." := RequisitionLine."Line No.";
                                    MaintenanceLine.MODIFY;
                                END;
                            UNTIL MaintenanceLine.NEXT = 0;
                    END;
                    MESSAGE('Indent is Created'); //PCPL0017
                end;
            }
            action("Get Components")
            {

                trigger OnAction();
                begin
                    ComponentList.RESET;
                    ComponentList.SETRANGE("FA No.", rec."FA No.");
                    IF ComponentList.FINDSET THEN
                        IF (PAGE.RUNMODAL(50107, ComponentList) = ACTION::LookupOK) THEN;

                    CLEAR(vLine);
                    ComponentList.RESET;
                    ComponentList.SETRANGE("FA No.", rec."FA No.");
                    ComponentList.SETRANGE(Select, TRUE);
                    IF ComponentList.FINDFIRST THEN
                        REPEAT
                            recML.RESET;
                            recML.SETRANGE("Document No.", rec."No.");
                            IF recML.FINDLAST THEN
                                vLine := recML."Line No." + 10000
                            ELSE
                                vLine := 10000;
                            recML.INIT;
                            recML."Document No." := rec."No.";
                            recML."Line No." := vLine;
                            recML."Component Type" := ComponentList."Component Type";
                            recML.Component := ComponentList.Component;
                            recML.Description := ComponentList.Description;
                            recML.Quantity := ComponentList.Quantity;
                            recML."Location Code" := rec."Location Code";
                            recILE.RESET;
                            recILE.SETRANGE("Location Code", rec."Location Code");
                            recILE.SETRANGE("Item No.", ComponentList.Component);
                            IF recILE.FINDFIRST THEN
                                REPEAT
                                    recML."Inventory  Qty" += recILE."Remaining Quantity";
                                UNTIL recILE.NEXT = 0;
                            recML.INSERT;
                        UNTIL ComponentList.NEXT = 0;
                    //PCPL-25
                    ComponentList.RESET;
                    ComponentList.SETRANGE("FA No.", rec."FA No.");
                    ComponentList.SETRANGE(Select, TRUE);
                    IF ComponentList.FINDFIRST THEN
                        REPEAT
                            ComponentList.Select := FALSE;
                            ComponentList.MODIFY;
                            COMMIT;
                        UNTIL ComponentList.NEXT = 0;
                    //PCPL-25
                end;
            }
            group(IncomingDocument)
            {
                CaptionML = ENU = 'Incoming Document',
                            ENN = 'Incoming Document';
                Image = Documents;
                action(IncomingDocCard)
                {
                    CaptionML = ENU = 'View Incoming Document',
                                ENN = 'View Incoming Document';
                    Enabled = HasIncomingDocument;
                    Image = ViewOrder;
                    ToolTipML =;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        IncomingDocument.ShowCardFromEntryNo(rec."Incoming Document Entry No.");
                    end;
                }
                action(SelectIncomingDoc)
                {
                    AccessByPermission = TableData 130 = R;
                    CaptionML = ENU = 'Select Incoming Document',
                                ENN = 'Select Incoming Document';
                    Image = SelectLineToApply;
                    ToolTipML =;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        rec.VALIDATE("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(rec."Incoming Document Entry No.", rec.RecordId));
                    end;
                }
                action(IncomingDocAttachFile)
                {
                    CaptionML = ENU = 'Create Incoming Document from File',
                                ENN = 'Create Incoming Document from File';
                    Ellipsis = true;
                    Image = Attach;
                    ToolTipML =;

                    trigger OnAction();
                    var
                        IncomingDocumentAttachment: Record 133;
                    begin
                        //IncomingDocumentAttachment.NewAttachmentFromMHDocument(Rec);    //temp comment
                    end;
                }
                action(RemoveIncomingDoc)
                {
                    CaptionML = ENU = 'Remove Incoming Document',
                                ENN = 'Remove Incoming Document';
                    Enabled = HasIncomingDocument;
                    Image = RemoveLine;
                    ToolTipML =;
                    Visible = false;

                    trigger OnAction();
                    begin
                        rec."Incoming Document Entry No." := 0;
                    end;
                }
                action("Requsition OLD")
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        rec.TESTFIELD("Location Code");//PCPL0017
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", rec."No.");
                        MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                        IF MaintenanceLine.FINDFIRST THEN
                            REPEAT
                                MaintenanceLine.CALCFIELDS("Inventory  Qty");
                                IF MaintenanceLine.Quantity <= MaintenanceLine."Inventory  Qty" THEN
                                    ERROR('Inventory is already available. Please create Indent only if it is needed');//PCPL0017
                            UNTIL MaintenanceLine.NEXT = 0;
                        CLEAR(ReqCreated);
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", rec."No.");
                        MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                        MaintenanceLine.SETRANGE("Req no.", '');
                        IF NOT MaintenanceLine.FINDFIRST THEN
                            ERROR('No Item lines in Job Card or Indent already created')
                        ELSE BEGIN
                            RequisitionHeader.INIT;
                            PurchSetup.GET;
                            //RequisitionHeader."Requisition No":=NoSeriesMgt.GetNextNo(PurchSetup."Requisition No Series",TODAY,FALSE);
                            //NoSeriesMgt.InitSeries(PurchSetup."Requisition No Series",PurchSetup."Requisition No Series",TODAY,RequisitionHeader."Requisition No",PurchSetup."Requisition No Series");
                            NoSeriesMgt.InitSeries(PurchSetup."Indent No.1", PurchSetup."Indent No.1", TODAY, RequisitionHeader."No.", PurchSetup."Indent No.1");
                            RequisitionHeader.VALIDATE(Date, TODAY);//PCPL0017
                            RequisitionHeader.VALIDATE("Creation Date", TODAY);
                            RequisitionHeader.VALIDATE(Status, RequisitionHeader.Status::Open);
                            //RequisitionHeader.VALIDATE("Job Reference","No.");//PCPL0017
                            RequisitionHeader.VALIDATE("Job Maintenance No.", rec."No.");    //PCPL-25
                            RequisitionHeader.VALIDATE("Location Code", rec."Location Code");//PCPL0017
                                                                                             //RequisitionHeader.VALIDATE("Final Version",TRUE);  COMMIT;
                            RequisitionHeader.INSERT;
                            COMMIT;
                            ReqCreated := TRUE;
                            CLEAR(vLine);
                            MaintenanceLine.RESET;
                            MaintenanceLine.SETRANGE("Document No.", rec."No.");
                            MaintenanceLine.SETRANGE("Component Type", MaintenanceLine."Component Type"::Item);
                            MaintenanceLine.SETFILTER("Req no.", '');
                            IF MaintenanceLine.FINDFIRST THEN
                                REPEAT
                                    IF ReqCreated THEN BEGIN
                                        RequisitionLine.RESET;
                                        RequisitionLine.SETRANGE("Document No.", RequisitionHeader."No.");
                                        IF RequisitionLine.FINDLAST THEN
                                            vLine := RequisitionLine."Line No." + 10000
                                        ELSE
                                            vLine := 10000;
                                        RequisitionLine.INIT;
                                        RequisitionLine."Document No." := RequisitionHeader."No.";
                                        RequisitionLine."Line No." := vLine;
                                        RequisitionLine.VALIDATE(Type, RequisitionLine.Type::Item);
                                        RequisitionLine.VALIDATE("No.", MaintenanceLine.Component);
                                        RequisitionLine.VALIDATE(Quantity, MaintenanceLine.Quantity);
                                        //RequisitionLine.VALIDATE("Job Reference No.","No.");
                                        RequisitionLine.VALIDATE("Job Maintenance No.", rec."No.");    //PCPL-25
                                        RequisitionLine.VALIDATE("Location Code", rec."Location Code");//PCPL0017
                                                                                                       //RequisitionLine.VALIDATE("Bin Code","Bin Code");//PCPL0017
                                        RequisitionLine.INSERT;
                                        //vLine+=10000;
                                        MaintenanceLine."Req no." := RequisitionLine."Document No.";
                                        MaintenanceLine."Req Line no." := RequisitionLine."Line No.";
                                        MaintenanceLine.MODIFY;
                                    END;
                                UNTIL MaintenanceLine.NEXT = 0;
                        END;
                        MESSAGE('Indent is Created'); //PCPL0017
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        HasIncomingDocument := rec."Incoming Document Entry No." <> 0;

        CLEAR(EditField);
        Usersetup.GET(USERID);
        IF Usersetup."Maintenance job.approval ID" THEN BEGIN
            EditField := TRUE;
        END
        ELSE
            EditField := FALSE;
    end;

    trigger OnOpenPage();
    begin
        IF rec.Status = rec.Status::"Under Maintenance" THEN
            CurrPage.EDITABLE(FALSE)
        ELSE
            IF rec.Status = rec.Status::Created THEN
                CurrPage.EDITABLE(TRUE);
    end;

    var
        ItemJournalLine: Record 83;
        MaintenanceLine: Record 50037;
        vLine: Integer;
        recFA: Record 5600;
        vDocNo: Code[20];
        ComponentList: Record 50000;
        recML: Record 50037;
        recILE: Record 32;
        recItem: Record 27;
        ItemJnlTemplate: Record 82;
        ItemJnlBatch: Record 233;
        NoSeriesMgt: Codeunit 396;
        PurchaseHeader: Record 38;
        PurchaseLine: Record 39;
        PurchSetup: Record 312;
        HasIncomingDocument: Boolean;
        ReqCreated: Boolean;
        RequisitionHeader: Record 50002;
        RequisitionLine: Record 50003;
        EditField: Boolean;
        Usersetup: Record 91;
}

