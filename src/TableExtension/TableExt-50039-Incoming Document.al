tableextension 50039 Incoming_Document_ext extends "Incoming Document"
{
    // version NAVW19.00.00.47444,PCPL-FA-1.0,//PCPLTDS194Q,PCPL-25/INCDoc,PCPL/FinishedProd/INCDoc

    fields
    {

        //Unsupported feature: Change Editable on "Posted(Field 13)". Please convert manually.

        modify("Document Type")
        {
            OptionCaptionML = ENU = 'Journal,Sales Invoice,Sales Credit Memo,Purchase Invoice,Purchase Credit Memo,Vendor,Customer,Indent Header,Finished Production,Posted Inspection, ', ENN = 'Journal,Sales Invoice,Sales Credit Memo,Purchase Invoice,Purchase Credit Memo,Vendor,Customer,Indent Header,Finished Production,Posted Inspection, ';

            //Unsupported feature: Change OptionString on ""Document Type"(Field 15)". Please convert manually.

        }



    }

    procedure SetMHDoc(VAR MaintenanceHeader: Record "Maintenance Header")
    begin
        //PCPL-FA-1.0
        IF MaintenanceHeader."Incoming Document Entry No." = 0 THEN
            EXIT;
        GET(MaintenanceHeader."Incoming Document Entry No.");
        TestReadyForProcessing;
        TestIfAlreadyExists;


        IF NOT DocLinkExists(MaintenanceHeader) THEN
            MaintenanceHeader.ADDLINK(GetURL, Description);
    end;

    local procedure TestIfAlreadyExists()
    var
        GenJnlLine: Record "Gen. Journal Line";
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
    begin
        case "Document Type" of
            "Document Type"::Journal:
                begin
                    GenJnlLine.SetRange("Incoming Document Entry No.", "Entry No.");
                    if GenJnlLine.FindFirst then
                        Error(AlreadyUsedInJnlErr, GenJnlLine."Journal Batch Name", GenJnlLine."Line No.");
                end;
            "Document Type"::"Sales Invoice", "Document Type"::"Sales Credit Memo":
                begin
                    SalesHeader.SetRange("Incoming Document Entry No.", "Entry No.");
                    if SalesHeader.FindFirst then
                        Error(AlreadyUsedInDocHdrErr, SalesHeader."Document Type", SalesHeader."No.", SalesHeader.TableCaption);
                end;
            "Document Type"::"Purchase Invoice", "Document Type"::"Purchase Credit Memo":
                begin
                    PurchaseHeader.SetRange("Incoming Document Entry No.", "Entry No.");
                    if PurchaseHeader.FindFirst then
                        Error(AlreadyUsedInDocHdrErr, PurchaseHeader."Document Type", PurchaseHeader."No.", PurchaseHeader.TableCaption);
                end;
        end;
    end;

    Procedure SetVendorDoc(VAR Vendor: Record Vendor)
    Begin
        //PCPLTDS194Q
        IF Vendor."Incoming Document Entry No." = 0 THEN
            EXIT;
        GET(Vendor."Incoming Document Entry No.");
        TestReadyForProcessing;
        TestIfAlreadyExists;
        IF NOT DocLinkExists(Vendor) THEN
            Vendor.ADDLINK(GetURL, Description);
        //PCPLTDS194Q
    End;


    local procedure DocLinkExists(RecVar: Variant): Boolean
    var
        RecordLink: Record "Record Link";
        RecRef: RecordRef;
    begin
        if GetURL = '' then
            exit(true);
        RecRef.GetTable(RecVar);
        RecordLink.SetRange("Record ID", RecRef.RecordId);
        RecordLink.SetRange(URL1, URL);
        RecordLink.SetRange(Description, Description);
        exit(not RecordLink.IsEmpty);
    end;

    var
        AlreadyUsedInJnlErr: Label 'The incoming document has already been assigned to journal batch %1, line number. %2.', Comment = '%1 = journal batch name, %2=line number.';
        AlreadyUsedInDocHdrErr: Label 'The incoming document has already been assigned to %1 %2 (%3).', Comment = '%1=document type, %2=document number, %3=table name, e.g. Sales Header.';

}

