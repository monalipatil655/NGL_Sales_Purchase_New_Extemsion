pageextension 50006 Customer_Card extends "Customer Card"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,//PCPLTDS194Q

    layout
    {
        addafter("Invoice Disc. Code")
        {
            field("Free Trade Zone"; rec."Free Trade Zone")
            {
                Visible = false;
                ApplicationArea = all;
            }
            field("Drug Lic. No. 1"; rec."Drug Lic. No. 1")
            {
                ApplicationArea = all;
            }
            field("Drug Lic. No. 2"; rec."Drug Lic. No. 2")
            {
                ApplicationArea = all;
            }

            field(SEZ; rec.SEZ)
            {
                ApplicationArea = all;
            }
            field("Incoming Document Entry No."; rec."Incoming Document Entry No.")
            {
                ApplicationArea = all;
            }
            field("No Payment Remainder"; Rec."No Payment Remainder")
            {
                ApplicationArea = all;
            }
        }
        addafter("ARN No.")
        {
            field("Balance Approval Mail"; rec."Balance Approval Mail")
            {
                ApplicationArea = all;
            }
        }
        addbefore(SalesHistBilltoFactBox)
        {
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;
            }
        }
    }
    actions
    {


        addbefore("&Customer")
        {
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
                        IncomingDocument.ShowCardFromEntryNo(rec."Incoming Document Entry No.");
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
                        rec.VALIDATE(rec."Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(rec."Incoming Document Entry No.", rec.RecordId));
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
                        IncomingDocumentAttachment.NewAttachmentFromCustomerDocument(Rec);
                    end;
                }
                action(RemoveIncomingDoc)
                {
                    Caption = 'Remove Incoming Document';
                    Enabled = HasIncomingDocument;
                    Image = RemoveLine;

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
        "--": Integer;
        HasIncomingDocument: Boolean;




}

