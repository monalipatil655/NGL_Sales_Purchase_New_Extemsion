pageextension 50001 Payment_Terms_ext extends "Payment Terms"
{
    // version NAVW17.00

    layout
    {
        addafter(Description)
        {
            field("PDC Mail"; rec."PDC Mail")
            {
                ApplicationArea = all;
            }
        }
    }
}

