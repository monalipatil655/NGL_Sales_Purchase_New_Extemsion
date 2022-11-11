pageextension 50049 Contact_Card extends "Contact Card"
{
    // version NAVW19.00.00.45778

    layout
    {

        addafter("E-Mail")
        {
            field("E-Mail 2"; rec."E-Mail 2")
            {
                ApplicationArea = all;
            }
        }
    }



}

