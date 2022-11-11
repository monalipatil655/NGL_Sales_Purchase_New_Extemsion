page 50104 "Sales Shipment Line Modify"
{
    PageType = List;
    Permissions = TableData 111 = rm;
    SourceTable = 111;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = ALL;

                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = ALL;

                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = ALL;

                }
                field(Type; rec.Type)
                {
                    ApplicationArea = ALL;

                }
                field("No."; rec."No.")
                {
                    ApplicationArea = ALL;

                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = ALL;

                }
                field("Posting Group"; rec."Posting Group")
                {
                    ApplicationArea = ALL;

                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = ALL;

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = ALL;

                }
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = ALL;

                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    ApplicationArea = ALL;

                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = ALL;

                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = ALL;

                }
                field("Unit Cost (LCY)"; rec."Unit Cost (LCY)")
                {
                    ApplicationArea = ALL;

                }
                field("VAT %"; rec."VAT %")
                {
                    ApplicationArea = ALL;

                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    ApplicationArea = ALL;

                }
                field("Allow Invoice Disc."; rec."Allow Invoice Disc.")
                {
                    ApplicationArea = ALL;

                }
                field("Gross Weight"; rec."Gross Weight")
                {
                    ApplicationArea = ALL;

                }
                field("Net Weight"; rec."Net Weight")
                {
                    ApplicationArea = ALL;

                }
                field("Units per Parcel"; rec."Units per Parcel")
                {
                    ApplicationArea = ALL;

                }
                field("Unit Volume"; rec."Unit Volume")
                {
                    ApplicationArea = ALL;

                }
                field("Appl.-to Item Entry"; rec."Appl.-to Item Entry")
                {
                    ApplicationArea = ALL;

                }
                field("Item Shpt. Entry No."; rec."Item Shpt. Entry No.")
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
                field("Customer Price Group"; rec."Customer Price Group")
                {
                    ApplicationArea = ALL;

                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = ALL;

                }
                field("Work Type Code"; rec."Work Type Code")
                {
                    ApplicationArea = ALL;

                }
                field("Qty. Shipped Not Invoiced"; rec."Qty. Shipped Not Invoiced")
                {
                    ApplicationArea = ALL;

                }
                field("Quantity Invoiced"; rec."Quantity Invoiced")
                {
                    ApplicationArea = ALL;

                }
                field("Order No."; rec."Order No.")
                {
                    ApplicationArea = ALL;

                }
                field("Order Line No."; rec."Order Line No.")
                {
                    ApplicationArea = ALL;

                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = ALL;

                }
                field("Purchase Order No."; rec."Purchase Order No.")
                {
                    ApplicationArea = ALL;

                }
                field("Purch. Order Line No."; rec."Purch. Order Line No.")
                {
                    ApplicationArea = ALL;

                }
                field("Drop Shipment"; rec."Drop Shipment")
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
                field("VAT Calculation Type"; rec."VAT Calculation Type")
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
                field("Attached to Line No."; rec."Attached to Line No.")
                {
                    ApplicationArea = ALL;

                }
                field("Exit Point"; rec."Exit Point")
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
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = ALL;

                }
                field("Tax Liable"; rec."Tax Liable")
                {
                    ApplicationArea = ALL;

                }
                field("Tax Group Code"; rec."Tax Group Code")
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
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;

                }
                field("Blanket Order No."; rec."Blanket Order No.")
                {
                    ApplicationArea = ALL;

                }
                field("Blanket Order Line No."; rec."Blanket Order Line No.")
                {
                    ApplicationArea = ALL;

                }
                field("VAT Base Amount"; rec."VAT Base Amount")
                {
                    ApplicationArea = ALL;

                }
                field("Unit Cost"; rec."Unit Cost")
                {
                    ApplicationArea = ALL;

                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = ALL;

                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = ALL;

                }
                field("Authorized for Credit Card"; rec."Authorized for Credit Card")
                {
                    ApplicationArea = ALL;

                }
                field("Job Task No."; rec."Job Task No.")
                {
                    ApplicationArea = ALL;

                }
                field("Job Contract Entry No."; rec."Job Contract Entry No.")
                {
                    ApplicationArea = ALL;

                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = ALL;

                }
                field("Bin Code"; rec."Bin Code")
                {
                    ApplicationArea = ALL;

                }
                field("Qty. per Unit of Measure"; rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = ALL;

                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = ALL;

                }
                field("Quantity (Base)"; rec."Quantity (Base)")
                {
                    ApplicationArea = ALL;

                }
                field("Qty. Invoiced (Base)"; rec."Qty. Invoiced (Base)")
                {
                    ApplicationArea = ALL;

                }
                field("FA Posting Date"; rec."FA Posting Date")
                {
                    ApplicationArea = ALL;

                }
                field("Depreciation Book Code"; rec."Depreciation Book Code")
                {
                    ApplicationArea = ALL;

                }
                field("Depr. until FA Posting Date"; rec."Depr. until FA Posting Date")
                {
                    ApplicationArea = ALL;

                }
                field("Duplicate in Depreciation Book"; rec."Duplicate in Depreciation Book")
                {
                    ApplicationArea = ALL;

                }
                field("Use Duplication List"; rec."Use Duplication List")
                {
                    ApplicationArea = ALL;

                }
                field("Responsibility Center"; rec."Responsibility Center")
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

