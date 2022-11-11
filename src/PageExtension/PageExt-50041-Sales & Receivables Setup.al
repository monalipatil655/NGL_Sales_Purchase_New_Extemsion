pageextension 50041 Sales_Receivbles_setup extends "Sales & Receivables Setup"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316

    layout
    {

        addafter("Archive Quotes")
        {
            field("No of Days"; rec."No of Days")
            {
                ApplicationArea = all;
            }
            field("Over Due Mail"; rec."Over Due Mail")
            {
                ApplicationArea = all;
            }
            field("Over Due Mail CC"; rec."Over Due Mail CC")
            {
                ApplicationArea = all;
            }
        }
    }



}

