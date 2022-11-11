tableextension 50063 Purch_Payables_Setup extends "Purchases & Payables Setup"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,//PCPL AntiCost

    fields
    {


        field(50002; "Quotation No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003; "WO Sales Invoice Path"; Text[150])
        {
            Description = 'pcpl002430oct';
        }
        field(50005; "Posted Forward Commission"; Code[10])
        {
        }
        field(50006; "RMPM Nos"; Code[10])
        {
            Description = '//PCPL AntiCost';
            TableRelation = "No. Series";
        }
        field(50007; "Formulation BOM Nos."; Code[10])
        {
            Description = '//PCPL AntiCost';
            TableRelation = "No. Series";
        }

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

