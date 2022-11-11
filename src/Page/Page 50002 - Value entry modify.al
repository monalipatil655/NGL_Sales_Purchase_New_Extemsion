page 50002 "Value entry modify"
{
    PageType = List;
    Permissions = TableData 5802 = rimd;
    SourceTable = 5802;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Item No."; rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Item Ledger Entry Type"; Rec."Item Ledger Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Source Posting Group"; Rec."Source Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Item Ledger Entry No."; Rec."Item Ledger Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Valued Quantity"; Rec."Valued Quantity")
                {
                    ApplicationArea = all;
                }
                field("Item Ledger Entry Quantity"; Rec."Item Ledger Entry Quantity")
                {
                    ApplicationArea = all;
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ApplicationArea = all;
                }
                field("Cost per Unit"; Rec."Cost per Unit")
                {
                    ApplicationArea = all;
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                    ApplicationArea = all;
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = all;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                    ApplicationArea = all;
                }
                field("Cost Posted to G/L"; Rec."Cost Posted to G/L")
                {
                    ApplicationArea = all;
                }
                field(Adjustment; Rec.Adjustment)
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = all;
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = all;
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                    ApplicationArea = all;
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Actual) (ACY)"; Rec."Cost Amount (Actual) (ACY)")
                {
                    ApplicationArea = all;
                }
                field("Cost Posted to G/L (ACY)"; Rec."Cost Posted to G/L (ACY)")
                {
                    ApplicationArea = all;
                }
                field("Cost per Unit (ACY)"; Rec."Cost per Unit (ACY)")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = all;
                }
                field("Order Type"; Rec."Order Type")
                {
                    ApplicationArea = all;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                    ApplicationArea = all;
                }
                field("Expected Cost"; Rec."Expected Cost")
                {
                    ApplicationArea = all;
                }
                field("Item Charge No."; Rec."Item Charge No.")
                {
                    ApplicationArea = all;
                }
                field("Valued By Average Cost"; rec."Valued By Average Cost")
                {
                    ApplicationArea = all;
                }
                field("Partial Revaluation"; rec."Partial Revaluation")
                {
                    ApplicationArea = all;
                }
                field(Inventoriable; rec.Inventoriable)
                {
                    ApplicationArea = all;
                }
                field("Valuation Date"; rec."Valuation Date")
                {
                    ApplicationArea = all;
                }
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Variance Type"; rec."Variance Type")
                {
                    ApplicationArea = all;
                }
                field("Purchase Amount (Actual)"; rec."Purchase Amount (Actual)")
                {
                    ApplicationArea = all;
                }
                field("Purchase Amount (Expected)"; rec."Purchase Amount (Expected)")
                {
                    ApplicationArea = all;
                }
                field("Sales Amount (Expected)"; rec."Sales Amount (Expected)")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Expected)"; rec."Cost Amount (Expected)")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Non-Invtbl.)"; rec."Cost Amount (Non-Invtbl.)")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Expected) (ACY)"; rec."Cost Amount (Expected) (ACY)")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Non-Invtbl.)(ACY)"; rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                    ApplicationArea = all;
                }
                field("Expected Cost Posted to G/L"; rec."Expected Cost Posted to G/L")
                {
                    ApplicationArea = all;
                }
                field("Exp. Cost Posted to G/L (ACY)"; rec."Exp. Cost Posted to G/L (ACY)")
                {
                    ApplicationArea = all;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = all;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = all;
                }
                field("Job Task No."; rec."Job Task No.")
                {
                    ApplicationArea = all;
                }
                field("Job Ledger Entry No."; rec."Job Ledger Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = all;
                }
                field("Average Cost Exception"; rec."Average Cost Exception")
                {
                    ApplicationArea = all;
                }
                field("Capacity Ledger Entry No."; rec."Capacity Ledger Entry No.")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Return Reason Code"; rec."Return Reason Code")
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

