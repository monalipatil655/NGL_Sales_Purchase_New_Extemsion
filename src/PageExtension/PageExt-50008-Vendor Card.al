pageextension 50008 Vendor_card extends "Vendor Card"
{


    layout
    {




        addafter(City)
        {
            field("MSME Registered"; rec."MSME Registered")
            {
                ApplicationArea = all;
            }
        }
        addafter(Transporter)
        {
            field(Password; rec.Password)
            {
                Visible = false;
                ApplicationArea = all;
            }
            field("Broker Name"; rec."Broker Name")
            {
                ApplicationArea = all;
            }
            field("Balance Approval Mail"; rec."Balance Approval Mail")
            {
                ApplicationArea = all;
            }
            field("Budgeted Amount"; rec."Budgeted Amount")
            {
                ApplicationArea = all;
            }
            field("Broker Email ID"; rec."Broker Email ID")
            {
                ApplicationArea = all;
            }
        }
        addafter("E-Mail")
        {
            field("E-Mail1"; rec."E-Mail1")
            {
                CaptionML = ENU = 'E-Mail1',
                            ENN = 'E-Mail';
                ApplicationArea = all;
            }
            field("E-Mail2"; rec."E-Mail2")
            {
                ApplicationArea = all;
            }
        }
        addafter("Prepayment %")
        {
            field("Credit Amount"; rec."Credit Amount")
            {
                Visible = false;
                ApplicationArea = all;
            }

            field("Incoming Document Entry No."; rec."Incoming Document Entry No.")
            {
                Editable = false;
                ApplicationArea = all;
            }
            field("TDS  Decleration"; rec."TDS  Decleration")
            {
                ApplicationArea = all;
            }
            field("TDS 194Q Applicable"; rec."TDS 194Q Applicable")
            {
                ApplicationArea = all;
            }
        }

        addfirst(factboxes)
        {
            part(ApprovalFactBox; 9092)
            {
                SubPageLink = "Table ID" = CONST(23);
                ApplicationArea = all;
            }
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;
                ApplicationArea = all;
            }
        }
    }
    actions
    {

        modify(Approve)
        {
            trigger OnAfterAction()
            begin
                //PCPL-25
                IF rec.Blocked = rec.Blocked::All THEN BEGIN
                    rec.Blocked := rec.Blocked::" ";
                    COMMIT;
                END;
                //PCPL-25

            end;
        }


        addfirst("Incoming Documents")
        {
            group(IncomingDocument)
            {
                action(ViewIncomingDocCard)
                {
                    Enabled = HasIncomingDocument;
                    Image = ViewOrder;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        IncomingDocument.ShowCardFromEntryNo(rec."Incoming Document Entry No.");
                    end;
                }
                action(SelectIncomingDoc)
                {
                    Enabled = NOT HasIncomingDocument;
                    Image = SelectLineToApply;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        rec.VALIDATE("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(rec."Incoming Document Entry No.", rec.RecordId));

                    end;
                }
                action(IncomingDocAttachFile)
                {
                    Enabled = NOT HasIncomingDocument;
                    Image = Attach;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        IncomingDocumentAttachment: Record 133;
                    begin
                        IncomingDocumentAttachment.NewAttachmentFromVendorDocument(Rec);

                    end;
                }
                action(RemoveIncomingDoc)
                {
                    Enabled = HasIncomingDocument;
                    //Image = removeline;
                    ApplicationArea = all;
                    trigger OnAction();
                    begin
                        rec."Incoming Document Entry No." := 0;
                    end;
                }
            }
        }

    }




    var
        ItemTrackingMgt: Codeunit 6500;

    var
        HasIncomingDocument: Boolean;




}

