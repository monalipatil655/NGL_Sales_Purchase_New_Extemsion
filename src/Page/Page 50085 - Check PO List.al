page 50085 "Check PO List"
{
    PageType = List;
    SourceTable = 38;
    SourceTableView = WHERE("Document Type" = CONST(Order),
                            Subcontracting = CONST(false));
    //"Import Document"=CONST(False));//PCPL/NSW/MIG  25July22

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Vendor No."; rec."Buy-from Vendor No.")
                {
                    ApplicationArea = ALL;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Vendor No."; rec."Pay-to Vendor No.")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Name"; rec."Pay-to Name")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Name 2"; rec."Pay-to Name 2")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Address"; rec."Pay-to Address")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Address 2"; rec."Pay-to Address 2")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to City"; rec."Pay-to City")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Contact"; rec."Pay-to Contact")
                {
                    ApplicationArea = ALL;
                }
                field("Your Reference"; rec."Your Reference")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Code"; rec."Ship-to Code")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Name"; rec."Ship-to Name")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Name 2"; rec."Ship-to Name 2")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Address"; rec."Ship-to Address")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Address 2"; rec."Ship-to Address 2")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to City"; rec."Ship-to City")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Contact"; rec."Ship-to Contact")
                {
                    ApplicationArea = ALL;
                }
                field("Order Date"; rec."Order Date")
                {
                    ApplicationArea = ALL;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = ALL;
                }
                field("Expected Receipt Date"; rec."Expected Receipt Date")
                {
                    ApplicationArea = ALL;
                }
                field("Posting Description"; rec."Posting Description")
                {
                    ApplicationArea = ALL;
                }
                field("Payment Terms Code"; rec."Payment Terms Code")
                {
                    ApplicationArea = ALL;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = ALL;
                }
                field("Payment Discount %"; rec."Payment Discount %")
                {
                    ApplicationArea = ALL;
                }
                field("Pmt. Discount Date"; rec."Pmt. Discount Date")
                {
                    ApplicationArea = ALL;
                }
                field("Shipment Method Code"; rec."Shipment Method Code")
                {
                    ApplicationArea = ALL;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = ALL;
                }
                field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = ALL;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Posting Group"; rec."Vendor Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field("Currency Factor"; rec."Currency Factor")
                {
                    ApplicationArea = ALL;
                }
                field("Prices Including VAT"; rec."Prices Including VAT")
                {
                    ApplicationArea = ALL;
                }
                field("Invoice Disc. Code"; rec."Invoice Disc. Code")
                {
                    ApplicationArea = ALL;
                }
                field("Language Code"; rec."Language Code")
                {
                    ApplicationArea = ALL;
                }
                field("Purchaser Code"; rec."Purchaser Code")
                {
                    ApplicationArea = ALL;
                }
                field("Order Class"; rec."Order Class")
                {
                    ApplicationArea = ALL;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = ALL;
                }
                field("No. Printed"; rec."No. Printed")
                {
                    ApplicationArea = ALL;
                }
                field("On Hold"; rec."On Hold")
                {
                    ApplicationArea = ALL;
                }
                field("Applies-to Doc. Type"; rec."Applies-to Doc. Type")
                {
                    ApplicationArea = ALL;
                }
                field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
                {
                    ApplicationArea = ALL;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = ALL;
                }
                field("Recalculate Invoice Disc."; rec."Recalculate Invoice Disc.")
                {
                    ApplicationArea = ALL;
                }
                field(Receive; rec.Receive)
                {
                    ApplicationArea = ALL;
                }
                field(Invoice; rec.Invoice)
                {
                    ApplicationArea = ALL;
                }
                field("Print Posted Documents"; rec."Print Posted Documents")
                {
                    ApplicationArea = ALL;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = ALL;
                }
                field("Amount Including VAT"; rec."Amount Including VAT")
                {
                    ApplicationArea = ALL;
                }
                field("Receiving No."; rec."Receiving No.")
                {
                    ApplicationArea = ALL;
                }
                field("Posting No."; rec."Posting No.")
                {
                    ApplicationArea = ALL;
                }
                field("Last Receiving No."; rec."Last Receiving No.")
                {
                    ApplicationArea = ALL;
                }
                field("Last Posting No."; rec."Last Posting No.")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Order No."; rec."Vendor Order No.")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Shipment No."; rec."Vendor Shipment No.")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Invoice No."; rec."Vendor Invoice No.")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Cr. Memo No."; rec."Vendor Cr. Memo No.")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Registration No."; rec."VAT Registration No.")
                {
                    ApplicationArea = ALL;
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = ALL;
                }
                field("Reason Code"; rec."Reason Code")
                {
                    ApplicationArea = ALL;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = ALL;
                }
                field("Transport Method"; rec."Transport Method")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Country/Region Code"; rec."VAT Country/Region Code")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Vendor Name"; rec."Buy-from Vendor Name")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Vendor Name 2"; rec."Buy-from Vendor Name 2")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Address"; rec."Buy-from Address")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Address 2"; rec."Buy-from Address 2")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from City"; rec."Buy-from City")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Contact"; rec."Buy-from Contact")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Post Code"; rec."Pay-to Post Code")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to County"; rec."Pay-to County")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Country/Region Code"; rec."Pay-to Country/Region Code")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Post Code"; rec."Buy-from Post Code")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from County"; rec."Buy-from County")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Country/Region Code"; rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Post Code"; rec."Ship-to Post Code")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to County"; rec."Ship-to County")
                {
                    ApplicationArea = ALL;
                }
                field("Ship-to Country/Region Code"; rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = ALL;
                }
                field("Bal. Account Type"; rec."Bal. Account Type")
                {
                    ApplicationArea = ALL;
                }
                field("Order Address Code"; rec."Order Address Code")
                {
                    ApplicationArea = ALL;
                }
                field("Entry Point"; rec."Entry Point")
                {
                    ApplicationArea = ALL;
                }
                field(Correction; rec.Correction)
                {
                    ApplicationArea = ALL;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = ALL;
                }
                field(Area_1; rec.Area)
                {
                    ApplicationArea = ALL;
                }
                field("Transaction Specification"; rec."Transaction Specification")
                {
                    ApplicationArea = ALL;
                }
                field("Payment Method Code"; rec."Payment Method Code")
                {
                    ApplicationArea = ALL;
                }
                field("No. Series"; rec."No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Posting No. Series"; rec."Posting No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Receiving No. Series"; rec."Receiving No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = ALL;
                }
                field("Tax Liable"; rec."Tax Liable")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Applies-to ID"; rec."Applies-to ID")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Base Discount %"; rec."VAT Base Discount %")
                {
                    ApplicationArea = ALL;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = ALL;
                }
                field("Invoice Discount Calculation"; rec."Invoice Discount Calculation")
                {
                    ApplicationArea = ALL;
                }
                field("Invoice Discount Value"; rec."Invoice Discount Value")
                {
                    ApplicationArea = ALL;
                }
                field("Send IC Document"; rec."Send IC Document")
                {
                    ApplicationArea = ALL;
                }
                field("IC Status"; rec."IC Status")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from IC Partner Code"; rec."Buy-from IC Partner Code")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to IC Partner Code"; rec."Pay-to IC Partner Code")
                {
                    ApplicationArea = ALL;
                }
                field("IC Direction"; rec."IC Direction")
                {
                    ApplicationArea = ALL;
                }
                field("Prepayment No."; rec."Prepayment No.")
                {
                    ApplicationArea = ALL;
                }
                field("Last Prepayment No."; rec."Last Prepayment No.")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Cr. Memo No."; rec."Prepmt. Cr. Memo No.")
                {
                    ApplicationArea = ALL;
                }
                field("Last Prepmt. Cr. Memo No."; rec."Last Prepmt. Cr. Memo No.")
                {
                    ApplicationArea = ALL;
                }
                field("Prepayment %"; rec."Prepayment %")
                {
                    ApplicationArea = ALL;
                }
                field("Prepayment No. Series"; rec."Prepayment No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Compress Prepayment"; rec."Compress Prepayment")
                {
                    ApplicationArea = ALL;
                }
                field("Prepayment Due Date"; rec."Prepayment Due Date")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Cr. Memo No. Series"; rec."Prepmt. Cr. Memo No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Posting Description"; rec."Prepmt. Posting Description")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Pmt. Discount Date"; rec."Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Payment Terms Code"; rec."Prepmt. Payment Terms Code")
                {
                    ApplicationArea = ALL;
                }
                field("Prepmt. Payment Discount %"; rec."Prepmt. Payment Discount %")
                {
                    ApplicationArea = ALL;
                }
                field("Quote No."; rec."Quote No.")
                {
                    ApplicationArea = ALL;
                }
                field("Job Queue Status"; rec."Job Queue Status")
                {
                    ApplicationArea = ALL;
                }
                field("Job Queue Entry ID"; rec."Job Queue Entry ID")
                {
                    ApplicationArea = ALL;
                }
                field("Incoming Document Entry No."; rec."Incoming Document Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Creditor No."; rec."Creditor No.")
                {
                    ApplicationArea = ALL;
                }
                field("Payment Reference"; rec."Payment Reference")
                {
                    ApplicationArea = ALL;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = ALL;
                }
                field("Invoice Discount Amount"; rec."Invoice Discount Amount")
                {
                    ApplicationArea = ALL;
                }
                field("No. of Archived Versions"; rec."No. of Archived Versions")
                {
                    ApplicationArea = ALL;
                }
                field("Doc. No. Occurrence"; rec."Doc. No. Occurrence")
                {
                    ApplicationArea = ALL;
                }
                field("Campaign No."; rec."Campaign No.")
                {
                    ApplicationArea = ALL;
                }
                field("Buy-from Contact No."; rec."Buy-from Contact No.")
                {
                    ApplicationArea = ALL;
                }
                field("Pay-to Contact No."; rec."Pay-to Contact No.")
                {
                    ApplicationArea = ALL;
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = ALL;
                }

                field("Completely Received"; rec."Completely Received")
                {
                    ApplicationArea = ALL;
                }
                field("Posting from Whse. Ref."; rec."Posting from Whse. Ref.")
                {
                    ApplicationArea = ALL;
                }
                field("Location Filter"; rec."Location Filter")
                {
                    ApplicationArea = ALL;
                }
                field("Requested Receipt Date"; rec."Requested Receipt Date")
                {
                    ApplicationArea = ALL;
                }
                field("Promised Receipt Date"; rec."Promised Receipt Date")
                {
                    ApplicationArea = ALL;
                }
                field("Lead Time Calculation"; rec."Lead Time Calculation")
                {
                    ApplicationArea = ALL;
                }
                field("Inbound Whse. Handling Time"; rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = ALL;
                }
                field("Date Filter"; rec."Date Filter")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Authorization No."; rec."Vendor Authorization No.")
                {
                    ApplicationArea = ALL;
                }
                field("Return Shipment No."; rec."Return Shipment No.")
                {
                    ApplicationArea = ALL;
                }
                field("Return Shipment No. Series"; rec."Return Shipment No. Series")
                {
                    ApplicationArea = ALL;
                }
                field(Ship; rec.Ship)
                {
                    ApplicationArea = ALL;
                }
                field("Last Return Shipment No."; rec."Last Return Shipment No.")
                {
                    ApplicationArea = ALL;
                }
                field("Assigned User ID"; rec."Assigned User ID")
                {
                    ApplicationArea = ALL;
                }
                field("Pending Approvals"; rec."Pending Approvals")
                {
                    ApplicationArea = ALL;
                }

            }
        }
    }

    actions
    {
    }
}

