tableextension 50065 Reservation_Entry extends "Reservation Entry"
{
    // version NAVW19.00.00.46621,NAVIN9.00.00.46621,PCPL/NGL/002

    fields
    {



        field(50001; "External Lot No."; Code[35])
        {
            CalcFormula = Lookup("Lot No. Information"."External Lot No." WHERE("Lot No." = FIELD("Lot No."),
                                                                                 "Item No." = FIELD("Item No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {

        //Unsupported feature: Deletion on ""Item No.,Variant Code,Location Code"(Key)". Please convert manually.

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

