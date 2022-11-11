tableextension 50031 User_Setup_ extends "User Setup"
{
    // version NAVW19.00.00.45778,QC2.0,PCPL-Indent 7.00.01,PCPL/QC/V3/001,PCPL-25/proofExp,PCPL-Permission

    fields
    {


        field(50005; "Bin Code"; Code[20])
        {
            Description = 'sanjay 23/01/2017//PCPL0041-04022020';
            TableRelation = Bin.Code;
        }

        field(50017; "User Designation"; Text[60])
        {
            Description = 'PCPL BRB';
        }
        field(50018; "Maintenance job.approval ID"; Boolean)
        {
        }
        field(50019; "Proof of Export"; Boolean)
        {
            Description = 'PCPL-25';
        }
        field(50020; "Chart of Account Access"; Boolean)
        {
            Description = 'PCPL0017';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

