page 50057 "Detailed Cust Modify"
{
    PageType = List;
    Permissions = TableData 379 = rimd;
    SourceTable = 379;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Cust. Ledger Entry No."; rec."Cust. Ledger Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = ALL;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = ALL;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = ALL;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = ALL;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = ALL;
                }
                field("Amount (LCY)"; rec."Amount (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Customer No."; rec."Customer No.")
                {
                    ApplicationArea = ALL;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = ALL;
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = ALL;
                }
                field("Transaction No."; rec."Transaction No.")
                {
                    ApplicationArea = ALL;
                }
                field("Journal Batch Name"; rec."Journal Batch Name")
                {
                    ApplicationArea = ALL;
                }
                field("Reason Code"; rec."Reason Code")
                {
                    ApplicationArea = ALL;
                }
                field("Debit Amount"; rec."Debit Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Credit Amount"; rec."Credit Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Debit Amount (LCY)"; rec."Debit Amount (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Credit Amount (LCY)"; rec."Credit Amount (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Initial Entry Due Date"; rec."Initial Entry Due Date")
                {
                    ApplicationArea = ALL;
                }
                field("Initial Entry Global Dim. 1"; rec."Initial Entry Global Dim. 1")
                {
                    ApplicationArea = ALL;
                }
                field("Initial Entry Global Dim. 2"; rec."Initial Entry Global Dim. 2")
                {
                    ApplicationArea = ALL;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Use Tax"; rec."Use Tax")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Initial Document Type"; rec."Initial Document Type")
                {
                    ApplicationArea = ALL;
                }
                field("Applied Cust. Ledger Entry No."; rec."Applied Cust. Ledger Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field(Unapplied; rec.Unapplied)
                {
                    ApplicationArea = ALL;
                }
                field("Unapplied by Entry No."; rec."Unapplied by Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Pmt. Disc. Possible"; rec."Remaining Pmt. Disc. Possible")
                {
                    ApplicationArea = ALL;
                }
                field("Max. Payment Tolerance"; rec."Max. Payment Tolerance")
                {
                    ApplicationArea = ALL;
                }
                field("Tax Jurisdiction Code"; rec."Tax Jurisdiction Code")
                {
                    ApplicationArea = ALL;
                }
                field("Application No."; rec."Application No.")
                {
                    ApplicationArea = ALL;
                }
                field("Ledger Entry Amount"; rec."Ledger Entry Amount")
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

