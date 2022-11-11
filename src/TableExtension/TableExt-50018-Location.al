tableextension 50018 Location_ext extends Location
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,TFS180484,PCPL/QC/V3/001

    fields
    {


        field(50001; "Unit Dimension"; Code[10])
        {
            Description = 'Sh 12.05.11';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('UNIT'));
        }
        field(50002; "PAN No."; Code[30])
        {
        }
        field(50003; "Format No."; Code[20])
        {
            Description = '#001 NGL';
        }
        field(50004; "Drug license No."; Code[50])
        {
            Description = 'sanjay';
        }
        field(50057; Description; Code[50])
        {
            Description = '//PCpl-25 QR Code';
        }

        field(50058; "Label Format No."; Code[20])
        {
            Description = 'PCPL0041-04022020';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

