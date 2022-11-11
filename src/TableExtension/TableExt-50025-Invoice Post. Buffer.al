tableextension 50025 Invoice_Post_Buffer_ext extends "Invoice Post. Buffer"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    fields
    {



        field(50115; "Dimension Entry No."; Integer)
        {
            Caption = 'Dimension Entry No.';
            Description = 'RSPL/EXIM 3.00.1';
        }
        field(33000990; "Excise Bus. Posting Group"; Code[10])
        {
            Description = 'GITLExim';
            Editable = false;
        }
        field(33000991; "Excise Prod. Posting Group"; Code[10])
        {
            Description = 'GITLExim';
            Editable = false;
        }
        field(33000992; "Excise Amount"; Decimal)
        {
            Description = 'GITLExim';
            Editable = false;
        }
        field(33000993; "BED %"; Decimal)
        {
            Description = 'GITLExim';
            Editable = false;
        }
        field(33000994; "BED Calculation Type"; Option)
        {
            Description = 'GITLExim';
            OptionCaption = 'Excise %,Amount/Unit,% of Accessable Value,Excise %+Amount/Unit';
            OptionMembers = "Excise %","Amount/Unit","% of Accessable Value","Excise %+Amount/Unit";
        }
        field(33000995; "Amount Including Excise"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33000996; "Excise Base Amount"; Decimal)
        {
            Description = 'GITLExim';
            Editable = false;
        }
        field(33000997; "E.C.C. No."; Code[20])
        {
            Description = 'GITLExim';
            //TableRelation = "E.C.C. Nos.";  //PCPL/NSW/MIG/  11July22
        }
        field(33000998; "BED Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33000999; "AED Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001000; "SED Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001001; "SAED Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001002; "CESS Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001003; "NCCD Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001004; "eCess Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33001020; "Commercial Invoice No."; Code[20])
        {
            Description = 'DEKI';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

