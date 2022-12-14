pageextension 50013 Item_led_Entry extends "Item Ledger Entries"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,PCPL/NGL/002,PCPL-FA-1.0

    layout
    {
        addafter("Entry Type")
        {
            field("Source No."; rec."Source No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Quantity)
        {

            field("Item Category Code"; rec."Item Category Code")
            {
                ApplicationArea = all;
            }

            field("Item Description"; rec."Item Description")
            {
                ApplicationArea = all;
            }
            field("Job Card Ref."; rec."Job Card Ref.")
            {
                ApplicationArea = all;

            }
            field("Certificate No"; rec."Certificate No")
            {
                Lookup = false;
                ApplicationArea = all;

            }
            field("External Lot No."; rec."External Lot No.")
            {
                ApplicationArea = all;
            }
            field("QC Status"; Rec."QC Status")
            {
                ApplicationArea = All;
            }
            field("QC Retest Date"; Rec."QC Retest Date")
            {
                ApplicationArea = All;
            }


        }
    }
    actions
    {

    }


}

