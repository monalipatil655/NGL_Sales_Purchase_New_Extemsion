tableextension 50077 Transfer_rece_header extends "Transfer Receipt Header"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0,PCPL/QC/V3/001

    fields
    {


        field(50000; "JW Delivery Challan"; Code[50])
        {
            Description = 'PCPL1.0';
            Editable = false;
        }
        field(50001; "Annexure 4(5) No."; Code[20])
        {
            Description = 'PCPL1.0';
            Editable = false;
        }
        field(50002; "Assign User id"; Text[30])
        {
            CalcFormula = Lookup("Transfer Header"."Assigned User ID" WHERE("No." = FIELD("Transfer Order No.")));
            FieldClass = FlowField;
        }
        field(50003; Postingdate_time; DateTime)
        {
        }

        field(50052; "User ID"; Text[50])
        {
            Description = 'PCPL-BRB';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

