pageextension 50063 Finished_Production_Orders extends "Finished Production Orders"
{
    // version NAVW19.00.00.45778,PCPL/FinishedProd/INCDoc

    layout
    {


        addafter(Description)
        {
            field("Lot No."; rec."Lot No.")
            {
                ApplicationArea = all;
            }
            field("Running Batch No"; rec."Running Batch No")
            {
                ApplicationArea = all;
            }
            field("Incoming Document Attached"; rec."Incoming Document Attached")
            {
                Enabled = HasIncomingDocument;
                ApplicationArea = all;
            }
        }
    }
    actions
    {

        modify(ProdOrderJobCard)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderJobCard(Action 1903594306)". Please convert manually.

        modify(ProdOrderMaterialRequisition)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderMaterialRequisition(Action 1902917606)". Please convert manually.

        modify(ProdOrderShortageList)
        {
            Visible = false;
        }

        //Unsupported feature: PropertyDeletion on "ProdOrderShortageList(Action 1903746906)". Please convert manually.

        addafter("Production Order List")
        {
            action("Job Card")
            {
                Image = Job;
                Promoted = true;
                PromotedCategory = "Report";
                ApplicationArea = all;

                trigger OnAction();
                begin
                    recFProdOrders.RESET;
                    recFProdOrders.SETRANGE(recFProdOrders.Status, recFProdOrders.Status::Finished);
                    recFProdOrders.SETRANGE(recFProdOrders."No.", rec."No.");
                    IF recFProdOrders.FINDFIRST THEN
                        REPORT.RUNMODAL(50075, TRUE, FALSE, recFProdOrders);
                end;
            }
            action("INTERMEDIATE INTIMATION SLIP")
            {
                Caption = 'INTERMEDIATE INTIMATION SLIP';
                RunObject = Report 50028;
                ApplicationArea = all;
            }
            action("FINISHED INTIMATION SLIP")
            {
                Caption = 'FINISHED INTIMATION SLIP';
                RunObject = Report 50014;
                ApplicationArea = all;
            }
            group(IncomingDocument)
            {
                action(IncomingDocCard)
                {
                    Caption = 'View Incoming Document';
                    Enabled = HasIncomingDocument;
                    Image = ViewOrder;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        IncomingDocument.ShowCardFromEntryNo(rec."Incoming Document Entry No.");        //PCPL-25
                    end;
                }
                action(SelectIncomingDoc)
                {
                    Caption = 'Select Incoming Document';
                    Enabled = NOT HasIncomingDocument;
                    Image = SelectLineToApply;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        rec.VALIDATE("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(rec."Incoming Document Entry No.", rec.RecordId));     //PCPL-25-
                    end;
                }
                action(IncomingDocAttachFile)
                {
                    Caption = 'Create Incoming Document from File';
                    Enabled = NOT HasIncomingDocument;
                    Image = Attach;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocumentAttachment: Record 133;
                    begin
                        IncomingDocumentAttachment.NewAttachmentFromFinishedProduction(Rec);    //PCPL-25
                    end;
                }
                action(RemoveIncomingDoc)
                {
                    Caption = 'Remove Incoming Document';
                    Enabled = HasIncomingDocument;
                    Image = RemoveLine;

                    trigger OnAction();
                    begin
                        recFProdOrders.RESET;
                        recFProdOrders.SETRANGE(recFProdOrders.Status, recFProdOrders.Status::Finished);
                        recFProdOrders.SETRANGE(recFProdOrders."No.", rec."No.");
                        IF recFProdOrders.FINDFIRST THEN BEGIN
                            recFProdOrders."Incoming Document Entry No." := 0;
                            recFProdOrders.MODIFY;
                            COMMIT;
                        END;
                    end;
                }
                action(DocumentAttached)
                {
                    Caption = 'Document Attached';

                    trigger OnAction();
                    begin
                        IF rec."Incoming Document Entry No." <> 0 THEN BEGIN
                            rec."Incoming Document Attached" := TRUE;
                            rec.MODIFY;
                        END
                        ELSE
                            IF rec."Incoming Document Entry No." = 0 THEN BEGIN
                                rec."Incoming Document Attached" := FALSE;
                                rec.MODIFY;
                            END;
                    end;
                }
            }
        }
    }

    var
        recFProdOrders: Record 5405;
        HasIncomingDocument: Boolean;
        RecUser: Record 91;
        TmpLocCode: Code[100];


    trigger OnAfterGetRecord()
    begin

        HasIncomingDocument := rec."Incoming Document Entry No." <> 0;    //PCPL-25

    end;




    trigger OnOpenPage();
    begin

        //PCPL0017
        RecUser.RESET;
        RecUser.SETRANGE(RecUser."User ID", USERID);
        IF RecUser.FINDFIRST THEN BEGIN
            TmpLocCode := RecUser."Location Code";
        END;
        IF TmpLocCode <> '' THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETFILTER("Location Code", TmpLocCode);
            rec.FILTERGROUP(0);
        END;
        //PCPL0017
    end;



}

