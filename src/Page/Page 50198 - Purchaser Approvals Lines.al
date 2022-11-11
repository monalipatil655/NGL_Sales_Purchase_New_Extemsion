page 50198 "Purchaser Approvals Lines"
{
    // version pcpl0024/Azhar

    PageType = List;
    SourceTable = 50028;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
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
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("PO Qty"; rec."PO Qty")
                {
                    ApplicationArea = all;
                }
                field(Approved; rec.Approved)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = all;
                }
                field("Requisition Line No."; rec."Requisition Line No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Requisition Templet Name"; rec."Requisition Templet Name")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Requisition Batch Name"; rec."Requisition Batch Name")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Outstanding True"; rec."Outstanding True")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Close; rec.Close)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Description 3"; rec."Description 3")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Material Requisitioned"; rec."Material Requisitioned")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Remark; rec.Remark)
                {
                    ApplicationArea = all;
                }
                field("USER ID"; rec."USER ID")
                {
                    ApplicationArea = all;
                }
                field("FA Component Category"; rec."FA Component Category")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Requirement Date"; rec."Requirement Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Product Group Code"; rec."Product Group Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Item Category Code"; rec."Item Category Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Category; rec.Category)
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = all;
                }
                field("Approved Date"; rec."Approved Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Approved By"; rec."Approved By")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Cost Allocation Dimension"; rec."Cost Allocation Dimension")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Release Date and Time"; rec."Release Date and Time")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Releaser User ID"; rec."Releaser User ID")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Approved Date and Time"; rec."Approved Date and Time")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("End Use"; rec."End Use")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Close UserID"; rec."Close UserID")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Comment for Close"; rec."Comment for Close")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Closingqty; rec.Closingqty)
                {
                    ApplicationArea = ALL;
                }
                field("Vendor Unit_ Price"; rec."Vendor Unit_ Price")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Vendor Discount %"; rec."Vendor Discount %")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Lead Time"; rec."Lead Time")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field(Availability; rec.Availability)
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Self Life"; rec."Self Life")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field(Observation; rec.Observation)
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Vendor No."; rec."Vendor No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field(Selected; rec.Selected)
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Mail Already Sent"; rec."Mail Already Sent")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Entry No"; rec."Entry No")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("PO Status"; rec."PO Status")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
                field("Quotation Qty"; rec."Quotation Qty")
                {
                    ApplicationArea = ALL;

                }
                field("Indent Closing Date"; rec."Indent Closing Date")
                {
                    Visible = false;
                    ApplicationArea = ALL;

                }
            }
        }
    }

    actions
    {
    }
}

