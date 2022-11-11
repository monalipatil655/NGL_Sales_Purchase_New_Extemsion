pageextension 50023 Applied_vend_Entries extends "Applied Vendor Entries"
{
    // version NAVW19.00.00.45778

    layout
    {
        addafter("Document No.")
        {
            field("Document Date"; rec."Document Date")
            {
                ApplicationArea = all;
            }
            field("Due Date"; rec."Due Date")
            {
                ApplicationArea = all;
            }
        }
    }
}

