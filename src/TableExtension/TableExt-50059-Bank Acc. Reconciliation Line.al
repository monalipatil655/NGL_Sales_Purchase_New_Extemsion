tableextension 50244 tableextension50244 extends "Bank Acc. Reconciliation Line"
{
    // version NAVW19.00.00.48466

    fields
    {


        field(50000; "Manual Cheque No."; Code[20])
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Cheque No." WHERE("Document No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

