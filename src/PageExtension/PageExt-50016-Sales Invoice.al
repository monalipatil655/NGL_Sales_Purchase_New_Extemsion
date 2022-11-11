pageextension 50016 Sales_invoice extends "Sales Invoice"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM

    layout
    {
        addafter("Job Queue Status")
        {
            field("Delivery Terms"; rec."Delivery Terms")
            {
                ApplicationArea = all;
            }

            field("Buyer Reference No."; rec."Buyer Reference No.")
            {
                ApplicationArea = all;
            }
            field("Posting No. Series"; rec."Posting No. Series")
            {
                ApplicationArea = all;
            }
        }

    }
    actions
    {

    }




}

