tableextension 50022 Item_led_ent_ext extends "Item Ledger Entry"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,PCPL/NGL/002,TFS180484,PCPL/QC/V3/001,PCPL-FA-1.0

    fields
    {
        field(50033; "Manufacturing Date"; Date)
        {
            Description = 'PCPL/BRB';
        }

        field(50102; "Packing Size"; Code[30])
        {
            Description = 'KAR1.0';
        }
        field(50103; "Item Description"; Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            Description = 'sanjay ngl';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50104; "Bin Name"; Code[50])
        {
            CalcFormula = Lookup("Warehouse Entry"."Bin Code" WHERE("Reference No." = FIELD("Document No.")));
            Description = 'Sanjay Ngl 11/11/2014';
            FieldClass = FlowField;
        }
        field(50105; "Certificate No"; Text[50])
        {
            CalcFormula = Lookup("Posted Inspection"."Certificate No." WHERE("Lot No." = FIELD("Lot No."),
                                                                              "Location Code" = FIELD("Location Code"),
                                                                              "Item No." = FIELD("Item No.")));
            Description = 'Sanjay ngl 11/11/2014';
            FieldClass = FlowField;
        }
        field(50106; "External Lot No."; Code[35])
        {
            CalcFormula = Lookup("Lot No. Information"."External Lot No." WHERE("Lot No." = FIELD("Lot No."),
                                                                                 "Item No." = FIELD("Item No.")));
            Description = 'PCPL/NGL/002';
            Editable = false;
            FieldClass = FlowField;
        }

        field(50108; "Job Card Ref."; Code[30])
        {
            Description = '//PCPL FA';
        }
        field(33000990; "Export Document"; Boolean)
        {
            Description = 'GITLExim';
        }
        field(33000991; "Import Document"; Boolean)
        {
            Description = 'GITLExim';
        }
    }
    keys
    {


    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

