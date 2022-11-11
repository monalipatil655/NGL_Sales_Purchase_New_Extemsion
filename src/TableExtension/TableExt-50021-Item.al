tableextension 50021 Item_ext extends Item
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484,PCPL/QC/V3/001,INC-2018-000974

    fields
    {


        field(50000; "Packing Type"; Text[50])
        {
        }
        field(50001; "Packing Size"; Text[50])
        {
        }
        field(50002; "Reg. No."; Text[50])
        {
        }
        field(50003; "Reg. Expiry"; Date)
        {
        }
        field(50004; "RC Status"; Option)
        {
            Description = '//Available,Not-Available,Expected';
            OptionCaption = 'Available,Not-Available,Expected';
            OptionMembers = Available,"Not-Available",Expected;
        }
        
        field(50011; "HS Code"; Code[20])
        {
            Description = 'Setu 28-Feb-13';
        }
        field(50023; Density; Decimal)
        {
        }
        field(50024; "Product Code"; Code[20])
        {
        }
       

        field(50066; "Tolerance %"; Decimal)
        {
            Description = 'INC-2018-000974';
        }
        field(33000990; "Import Duty Group"; Code[10])
        {
            Description = 'GITLExim';
            //TableRelation = "Import Duty Group".Code;
        }
    }
    keys
    {

        // key(Key14; "Excise Prod. Posting Group", "No.")
        // {
        // }
    }

    var
        PurchOrderLine: Record 39;
        SalesOrderLine: Record 37;
}

