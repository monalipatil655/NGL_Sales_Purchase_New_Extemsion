page 50066 "Vendor Catalog"
{
    // version PCPL/BRB/006

    PageType = List;
    SourceTable = 50066;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; rec."Item No.")
                {
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
                field("Lead Time Calculation"; rec."Lead Time Calculation")
                {
                    ApplicationArea = all;
                }
                field("Vendor Item No."; rec."Vendor Item No.")
                {
                    ApplicationArea = all;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = all;
                }
                field("Send Mail"; rec."Send Mail")
                {
                    ApplicationArea = all;
                }
                field("Vendor Type"; rec."Vendor Type")
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

