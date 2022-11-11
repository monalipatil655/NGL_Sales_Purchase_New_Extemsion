tableextension 50066 Entry_Summary extends "Entry Summary"
{
    // version NAVW19.00.00.45778,PCPL/NGL/002

    fields
    {


        field(50000; "COA No."; Code[50])
        {
        }
        field(50001; "External Lot No."; Code[35])
        {
            CalcFormula = Lookup("Lot No. Information"."External Lot No." WHERE("Lot No." = FIELD("Lot No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

