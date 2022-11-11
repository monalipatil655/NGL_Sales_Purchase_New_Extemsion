pageextension 50012 Item_List extends "Item List"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    layout
    {

        addafter("Shelf No.")
        {
            field(Inventory; rec.Inventory)
            {
                ApplicationArea = all;
            }
            field("Description 2"; rec."Description 2")
            {
                Editable = false;
                ApplicationArea = all;
            }
            field("Reordering Policy"; rec."Reordering Policy")
            {
                ApplicationArea = all;
            }
            field("Tolerance %"; rec."Tolerance %")
            {
                ApplicationArea = all;
            }
            field("Specs ID"; rec."Specs ID")
            {
                ApplicationArea = all;
            }
            field("Qty. on Prod. Order"; rec."Qty. on Prod. Order")
            {
                Visible = false;
                ApplicationArea = all;
            }
            field("Qty. on Component Lines"; rec."Qty. on Component Lines")
            {
                Visible = false;
                ApplicationArea = all;
            }
            field("Qty. on Purch. Order"; rec."Qty. on Purch. Order")
            {
                Visible = false;
            }
            field("Qty. on Sales Order"; rec."Qty. on Sales Order")
            {
                Visible = false;
            }
            field("Qty. in Transit"; rec."Qty. in Transit")
            {
                Visible = false;
            }
            field("Trans. Ord. Receipt (Qty.)"; rec."Trans. Ord. Receipt (Qty.)")
            {
                Visible = false;
            }
            field("Trans. Ord. Shipment (Qty.)"; rec."Trans. Ord. Shipment (Qty.)")
            {
                Visible = false;
            }

            field("Inventory Value Zero"; rec."Inventory Value Zero")
            {
                ApplicationArea = all;
            }
            field("Expiration Calculation"; rec."Expiration Calculation")
            {
                Visible = false;
            }
        }

        addafter("Assembly Policy")
        {
            field("Reorder Point"; rec."Reorder Point")
            {
                ApplicationArea = all;
            }
            field("Maximum Order Quantity"; rec."Maximum Order Quantity")
            {
                ApplicationArea = all;
            }
            field("Order Multiple"; rec."Order Multiple")
            {
                ApplicationArea = all;
            }
            field("Minimum Order Quantity"; rec."Minimum Order Quantity")
            {
                ApplicationArea = all;
            }
            field("Safety Stock Quantity"; rec."Safety Stock Quantity")
            {
                ApplicationArea = all;
            }
            field("Maximum Inventory"; rec."Maximum Inventory")
            {
                ApplicationArea = all;
            }
            field("Safety Lead Time"; rec."Safety Lead Time")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {


    }

}