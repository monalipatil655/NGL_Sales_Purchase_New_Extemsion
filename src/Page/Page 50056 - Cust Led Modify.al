page 50056 "Cust Led Modify"
{
    PageType = List;
    Permissions = TableData 21 = rimd;
    SourceTable = 21;

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
                field("Customer No."; rec."Customer No.")
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
                field(Description; rec.Description)
                {
                    ApplicationArea = ALL;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Amount"; rec."Remaining Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Original Amt. (LCY)"; rec."Original Amt. (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Amt. (LCY)"; rec."Remaining Amt. (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Amount (LCY)"; rec."Amount (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Sales (LCY)"; rec."Sales (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Profit (LCY)"; rec."Profit (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Inv. Discount (LCY)"; rec."Inv. Discount (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = ALL;
                }
                field("Customer Posting Group"; rec."Customer Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = ALL;
                }
                field("Global Dimension 2 Code"; rec."Global Dimension 2 Code")
                {
                    ApplicationArea = ALL;
                }
                field("Salesperson Code"; rec."Salesperson Code")
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
                field(Open; rec.Open)
                {
                    ApplicationArea = ALL;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = ALL;
                }
                field("Pmt. Discount Date"; rec."Pmt. Discount Date")
                {
                    ApplicationArea = ALL;
                }
                field("Original Pmt. Disc. Possible"; rec."Original Pmt. Disc. Possible")
                {
                    ApplicationArea = ALL;
                }
                field("Pmt. Disc. Given (LCY)"; rec."Pmt. Disc. Given (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field(Positive; rec.Positive)
                {
                    ApplicationArea = ALL;
                }
                field("Closed by Entry No."; rec."Closed by Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Closed at Date"; rec."Closed at Date")
                {
                    ApplicationArea = ALL;
                }
                field("Closed by Amount"; rec."Closed by Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Applies-to ID"; rec."Applies-to ID")
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
                field("Bal. Account Type"; rec."Bal. Account Type")
                {
                    ApplicationArea = ALL;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = ALL;
                }
                field("Transaction No."; rec."Transaction No.")
                {
                    ApplicationArea = ALL;
                }
                field("Closed by Amount (LCY)"; rec."Closed by Amount (LCY)")
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
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = ALL;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = ALL;
                }
                field("Calculate Interest"; rec."Calculate Interest")
                {
                    ApplicationArea = ALL;
                }
                field("Closing Interest Calculated"; rec."Closing Interest Calculated")
                {
                    ApplicationArea = ALL;
                }
                field("No. Series"; rec."No. Series")
                {
                    ApplicationArea = ALL;
                }
                field("Closed by Currency Code"; rec."Closed by Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field("Closed by Currency Amount"; rec."Closed by Currency Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Adjusted Currency Factor"; rec."Adjusted Currency Factor")
                {
                    ApplicationArea = ALL;
                }
                field("Original Currency Factor"; rec."Original Currency Factor")
                {
                    ApplicationArea = ALL;
                }
                field("Original Amount"; rec."Original Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Date Filter"; rec."Date Filter")
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Pmt. Disc. Possible"; rec."Remaining Pmt. Disc. Possible")
                {
                    ApplicationArea = ALL;
                }
                field("Pmt. Disc. Tolerance Date"; rec."Pmt. Disc. Tolerance Date")
                {
                    ApplicationArea = ALL;
                }
                field("Max. Payment Tolerance"; rec."Max. Payment Tolerance")
                {
                    ApplicationArea = ALL;
                }
                field("Last Issued Reminder Level"; rec."Last Issued Reminder Level")
                {
                    ApplicationArea = ALL;
                }
                field("Accepted Payment Tolerance"; rec."Accepted Payment Tolerance")
                {
                    ApplicationArea = ALL;
                }
                field("Accepted Pmt. Disc. Tolerance"; rec."Accepted Pmt. Disc. Tolerance")
                {
                    ApplicationArea = ALL;
                }
                field("Pmt. Tolerance (LCY)"; rec."Pmt. Tolerance (LCY)")
                {
                    ApplicationArea = ALL;
                }
                field("Amount to Apply"; rec."Amount to Apply")
                {
                    ApplicationArea = ALL;
                }
                field("IC Partner Code"; rec."IC Partner Code")
                {
                    ApplicationArea = ALL;
                }
                field("Applying Entry"; rec."Applying Entry")
                {
                    ApplicationArea = ALL;
                }
                field(Reversed; rec.Reversed)
                {
                    ApplicationArea = ALL;
                }
                field("Reversed by Entry No."; rec."Reversed by Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Reversed Entry No."; rec."Reversed Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field(Prepayment; rec.Prepayment)
                {
                    ApplicationArea = ALL;
                }
                field("Payment Method Code"; rec."Payment Method Code")
                {
                    ApplicationArea = ALL;
                }
                field("Applies-to Ext. Doc. No."; rec."Applies-to Ext. Doc. No.")
                {
                    ApplicationArea = ALL;
                }
                field("Recipient Bank Account"; rec."Recipient Bank Account")
                {
                    ApplicationArea = ALL;
                }
                field("Message to Recipient"; rec."Message to Recipient")
                {
                    ApplicationArea = ALL;
                }
                field("Exported to Payment File"; rec."Exported to Payment File")
                {
                    ApplicationArea = ALL;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = ALL;
                }
                field("Direct Debit Mandate ID"; rec."Direct Debit Mandate ID")
                {
                    ApplicationArea = ALL;
                }

                field("TCS Nature of Collection"; rec."TCS Nature of Collection")
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

