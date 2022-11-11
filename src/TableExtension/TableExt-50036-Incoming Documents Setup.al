tableextension 50036 Incoming_Docu_Setup extends "Incoming Documents Setup"
{
    // version NAVW19.00.00.45778,pcpl0024_Inc_Doc,PCPL-25/INCDoc,PCPL/FinishedProd/INCDoc

    fields
    {
        field(50000; "Sales Path"; Text[250])
        {
            Description = 'PCPL0024_INCDoc';
        }
        field(50001; "Purchase Path"; Text[250])
        {
            Description = 'PCPL0024_INCDoc';
        }
        field(50002; "Bank Receipt"; Text[250])
        {
            Description = 'PCPL0021';
        }
        field(50003; "Vendor Path"; Text[250])
        {
            Description = 'PCPL-25';
        }
        field(50004; "Customer Path"; Text[250])
        {
            Description = 'PCPL-25';
        }
        field(50005; "Indent Path"; Text[250])
        {
            Description = 'PCPL-25/INCDoc';
        }
        field(50006; "Finished Production Path"; Text[250])
        {
            Description = 'PCPL/FinishedProd/INCDoc';
        }
        field(50007; "Posted Inspection Path"; Text[250])
        {
            Description = 'PCPL/PosIns/INCDoc';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

