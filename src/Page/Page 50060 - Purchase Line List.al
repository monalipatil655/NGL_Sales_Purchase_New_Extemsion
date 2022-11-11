page 50060 "Purchase Line List"
{
    PageType = List;
    Permissions = TableData 39 = rimd;
    SourceTable = 39;
    SourceTableView = WHERE("Document Type" = FILTER(Order),
                            Type = FILTER(<> "G/L Account"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; rec."Document No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Buy-from Vendor No."; rec."Buy-from Vendor No.")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Name"; VendName)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Line No."; rec."Line No.")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field(Type; rec.Type)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("No."; rec."No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Location Code"; rec."Location Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Posting Group"; rec."Posting Group")
                {
                    ApplicationArea = ALL;
                }
                field(Description; rec.Description)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field(Quantity; rec.Quantity)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Order Date"; rec."Order Date")
                {
                    ApplicationArea = ALL;
                }
                field("Outstanding Quantity"; rec."Outstanding Quantity")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = ALL;
                }
                field("Qty. to Invoice"; rec."Qty. to Invoice")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Qty. to Receive"; rec."Qty. to Receive")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Direct Unit Cost"; rec."Direct Unit Cost")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Line Discount Amount"; rec."Line Discount Amount")
                {
                    Editable = false;
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
                field("Unit Price (LCY)"; rec."Unit Price (LCY)")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Quantity Received"; rec."Quantity Received")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field("Quantity Invoiced"; rec."Quantity Invoiced")
                {
                    ApplicationArea = ALL;
                }
                field("Receipt No."; rec."Receipt No.")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field("Indent No."; rec."Indent No.")
                {
                    ApplicationArea = ALL;
                }
                field("Receipt Line No."; rec."Receipt Line No.")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field("Pay-to Vendor No."; rec."Pay-to Vendor No.")
                {
                    ApplicationArea = ALL;
                }
                field("Inv. Discount Amount"; rec."Inv. Discount Amount")
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Item No."; rec."Vendor Item No.")
                {
                    ApplicationArea = ALL;
                }
                field("Sales Order No."; rec."Sales Order No.")
                {
                    ApplicationArea = ALL;
                }
                field("Sales Order Line No."; rec."Sales Order Line No.")
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
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF vend.GET(rec."Buy-from Vendor No.") THEN
            VendName := vend.Name;
    end;

    trigger OnOpenPage();
    begin
        //PCPL0041-13022020-Start
        rec.FILTERGROUP(2);
        rec.SETFILTER("Outstanding Quantity", '<>%1', 0);
        rec.FILTERGROUP(0);
        //PCPL0041-13022020-End
    end;

    var
        vend: Record 23;
        VendName: Text;
}

