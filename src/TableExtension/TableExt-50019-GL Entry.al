tableextension 50019 GLEntry_ext extends "G/L Entry"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484

    fields
    {



        field(33000990; "Original Amount"; Decimal)
        {
            Description = 'GITLExim';
        }
        field(33000991; "Currency Code"; Code[20])
        {
            Description = 'GITLExim';
        }
        field(33000992; "Conversion Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            Description = 'GITLExim';
        }
        field(33000993; "Tax/Charge Group"; Code[10])
        {
            Description = 'GITLExim';
        }
        field(33000994; "Tax/Charge Code"; Code[10])
        {
            Description = 'GITLExim';
        }
        field(33000995; "DDB No."; Code[20])
        {
            Description = 'GITLExim';
        }
    }
    keys
    {

        //Unsupported feature: PropertyChange on ""G/L Account No.,Global Dimension 1 Code,Global Dimension 2 Code,Posting Date,Location Code"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""G/L Account No.,Global Dimension 1 Code,Global Dimension 2 Code,Posting Date,Location Code"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""G/L Account No.,Business Unit Code,Posting Date"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""G/L Account No.,Business Unit Code,Posting Date"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""G/L Account No.,Business Unit Code,Global Dimension 1 Code,Global Dimension 2 Code,Posting Date"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""G/L Account No.,Business Unit Code,Global Dimension 1 Code,Global Dimension 2 Code,Posting Date"(Key)". Please convert manually.


        //Unsupported feature: PropertyChange on ""IC Partner Code"(Key)". Please convert manually.

        key(Key14; "Document No.", "Transaction No.")
        {
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

