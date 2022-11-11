pageextension 50014 Item_Journal extends "Item Journal"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    layout
    {

        modify("Item No.")
        {
            trigger OnAfterValidate()
            begin
                //PCPL41_05032020_S
                IF Item.GET(rec."Item No.") THEN
                    ItemDescription2 := Item."Description 2";

                IF rec."Item No." = '' THEN BEGIN
                    rec.Description := '';
                    ItemDescription2 := '';
                END;
                //PCPL41_05032020_E
            end;
        }




        modify("Variant Code")
        {
            trigger OnAfterValidate()
            begin
                //PCPL41_05032020_S
                ItemVariant.RESET;
                ItemVariant.SETRANGE(Code, rec."Variant Code");
                IF ItemVariant.FINDFIRST THEN
                    ItemDescription2 := ItemVariant."Description 2";

                IF rec."Variant Code" = '' THEN BEGIN
                    IF Item.GET(rec."Item No.") THEN
                        rec.Description := Item.Description;
                    ItemDescription2 := Item."Description 2";
                END;
                //PCPL41_05032020_E
            end;
        }




        addafter("Document Date")
        {
            field("Line No."; rec."Line No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Description 2"; ItemDescription2)
            {
                Caption = 'Description 2';
                ApplicationArea = all;
            }
        }
        addafter("Gen. Prod. Posting Group")
        {
            field("Inventory Posting Group"; rec."Inventory Posting Group")
            {
                ApplicationArea = all;
            }
            field("Create QC Inspection"; rec."Create QC Inspection")
            {
                ApplicationArea = all;
            }
            field("Quality Status"; rec."Quality Status")
            {
                ApplicationArea = all;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Unit Cost (Revalued)"; rec."Unit Cost (Revalued)")
            {
                ApplicationArea = all;
            }
            field("Unit Cost (Calculated)"; rec."Unit Cost (Calculated)")
            {
                ApplicationArea = all;
            }
        }
        addafter("Unit Amount")
        {
            field("Applied Amount"; rec."Applied Amount")
            {
                ApplicationArea = all;
            }
            field("Amount (ACY)"; rec."Amount (ACY)")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {


    }

    var
        ItemDescription2: Text[100];

    var
        OpenedFromBatch: Boolean;

    var
        Des2: Text[100];
        Item: Record 27;
        ItemVariant: Record 5401;



}

