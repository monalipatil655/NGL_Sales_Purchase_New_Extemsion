tableextension 50032 General_Led_Setup_ext_1 extends "General Ledger Setup"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,TFS180484\\pcpl0024_FILE GEN,PCPL41-EINV|EWAY

    fields
    {



        field(16617; "Distributed Invoice Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50000; "Posting date Check"; Boolean)
        {
        }
        field(50001; "Export File Path"; Text[250])
        {
            Description = 'pcpl0024_FILE GEN';
        }
        field(50002; "GST Validations"; Boolean)
        {
            Description = 'PCPL';
        }
        field(50003; "Bal. Account No"; Code[10])
        {
            Description = 'PCPL/BRB';
            TableRelation = "G/L Account";
        }
        field(50004; "File No."; Code[10])
        {
            Description = '//PCPL-25 File Gen';
        }
        field(50005; "File Date"; Date)
        {
            Description = '//PCPL-25 File Gen';
        }
        field(50006; "Client Code"; Code[30])
        {
            Description = '//PCPL-25 File Gen';
        }
        field(50007; "Domain ID"; Code[10])
        {
            Description = '//PCPL-25 File Gen';
        }
    }
}

