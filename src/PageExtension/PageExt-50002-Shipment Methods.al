pageextension 50002 Shipment_Methods_Ext extends "Shipment Methods"
{
    // version NAVW17.00

    layout
    {
        addafter(Description)
        {
            field("Port Code"; rec."Port Code")
            {
                ApplicationArea = all;
            }
        }
    }
}

