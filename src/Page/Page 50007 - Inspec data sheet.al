page 50007 "Inspec data sheet"
{
    PageType = List;
    Permissions = TableData 50011 = rimd;
    SourceTable = 50011;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Ref ID"; rec."Ref ID")
                {
                    ApplicationArea = all;
                }
                field("Specs ID"; rec."Specs ID")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = all;
                }
                field("Prod. Order Date"; rec."Prod. Order Date")
                {
                    ApplicationArea = all;
                }
                field("Lot No."; rec."Lot No.")
                {
                    ApplicationArea = all;
                }
                field("Purch. Order Quantity"; rec."Purch. Order Quantity")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Bin Code"; rec."Bin Code")
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field("Item No."; rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Item Description"; rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field("Item Description 2"; rec."Item Description 2")
                {
                    ApplicationArea = all;
                }
                field("Unit of Messure"; rec."Unit of Messure")
                {
                    ApplicationArea = all;
                }
                field("Item Tracking"; rec."Item Tracking")
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field("Certificate No."; rec."Certificate No.")
                {
                    ApplicationArea = all;
                }
                field("GRN No."; rec."GRN No.")
                {
                    ApplicationArea = all;
                }
                field("GRN Date"; rec."GRN Date")
                {
                    ApplicationArea = all;
                }
                field("GRN Quantity"; rec."GRN Quantity")
                {
                    ApplicationArea = all;
                }
                field("Prod. Order Quantity"; rec."Prod. Order Quantity")
                {
                    ApplicationArea = all;
                }
                field("Before GRN"; rec."Before GRN")
                {
                    ApplicationArea = all;
                }
                field("Transfer Receipt No."; rec."Transfer Receipt No.")
                {
                    ApplicationArea = all;
                }
                field("Transfer Receipt Quantity"; rec."Transfer Receipt Quantity")
                {
                    ApplicationArea = all;
                }
                field("Transfer Receipt Date"; rec."Transfer Receipt Date")
                {
                    ApplicationArea = all;
                }
                field("Return Receipt No."; rec."Return Receipt No.")
                {
                    ApplicationArea = all;
                }
                field("Return Receipt Quantity"; rec."Return Receipt Quantity")
                {
                    ApplicationArea = all;
                }
                field("Return Receipt Date"; rec."Return Receipt Date")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; rec."Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field(Approval; rec.Approval)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("QA Reviewed"; rec."QA Reviewed")
                {
                    ApplicationArea = all;
                }
                field("Reviewed By"; rec."Reviewed By")
                {
                    ApplicationArea = all;
                }
                field("Reviewed On"; rec."Reviewed On")
                {
                    ApplicationArea = all;
                }
                field("Approved Quantity"; rec."Approved Quantity")
                {
                    ApplicationArea = all;
                }
                field("Rejected Quantity"; rec."Rejected Quantity")
                {
                    ApplicationArea = all;
                }
                field("Sample Drawn Quantity"; rec."Sample Drawn Quantity")
                {
                    ApplicationArea = all;
                }
                field("Mfg. Date"; rec."Mfg. Date")
                {
                    ApplicationArea = all;
                }
                field("Analyzed on"; rec."Analyzed on")
                {
                    ApplicationArea = all;
                }
                field("Retest on"; rec."Retest on")
                {
                    ApplicationArea = all;
                }
                field("Sample Drawn On"; rec."Sample Drawn On")
                {
                    ApplicationArea = all;
                }
                field("Manufacturer Code"; rec."Manufacturer Code")
                {
                    ApplicationArea = all;
                }
                field("Manufacturer Name"; rec."Manufacturer Name")
                {
                    ApplicationArea = all;
                }
                field("Control Sample Quantity"; rec."Control Sample Quantity")
                {
                    ApplicationArea = all;
                }
                field("Posted Sample Quanity"; rec."Posted Sample Quanity")
                {
                    ApplicationArea = all;
                }
                field("Sample UOM"; rec."Sample UOM")
                {
                    ApplicationArea = all;
                }
                field("Incoming Document Entry No."; rec."Incoming Document Entry No.")
                {
                    ApplicationArea = all;
                }
                field("COA Printed"; rec."COA Printed")
                {
                    ApplicationArea = all;
                }
                field("Whse. Document No."; rec."Whse. Document No.")
                {
                    ApplicationArea = all;
                }
                field("Inspected By"; rec."Inspected By")
                {
                    ApplicationArea = all;
                }
                field("Approved By"; rec."Approved By")
                {
                    ApplicationArea = all;
                }
                field("Retest Document"; rec."Retest Document")
                {
                    ApplicationArea = all;
                }
                field("Retest from Doc No"; rec."Retest from Doc No")
                {
                    ApplicationArea = all;
                }
                field("Replanned Prod. Order"; rec."Replanned Prod. Order")
                {
                    ApplicationArea = all;
                }
                field("Replanned Item No."; rec."Replanned Item No.")
                {
                    ApplicationArea = all;
                }
                field("File Attach"; rec."File Attach")
                {
                    ApplicationArea = all;
                }
                field(Extension; rec.Extension)
                {
                    ApplicationArea = all;
                }
                field("Transferred to Quarantine Bin"; rec."Transferred to Quarantine Bin")
                {
                    ApplicationArea = all;
                }
                field("EXP Date"; rec."EXP Date")
                {
                    ApplicationArea = all;
                }
                field("External Lot No."; rec."External Lot No.")
                {
                    ApplicationArea = all;
                }
                field("Outer Package"; rec."Outer Package")
                {
                    ApplicationArea = all;
                }
                field("Inner Package"; rec."Inner Package")
                {
                    ApplicationArea = all;
                }
                field(SampleUOM; rec.SampleUOM)
                {
                    ApplicationArea = all;
                }
                field("No. Container Sample"; rec."No. Container Sample")
                {
                    ApplicationArea = all;
                }
                field("Sample By"; rec."Sample By")
                {
                    ApplicationArea = all;
                }
                field("Prod. Packing Detail"; rec."Prod. Packing Detail")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

