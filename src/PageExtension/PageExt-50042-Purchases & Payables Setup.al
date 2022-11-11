pageextension 50042 Purchase_Payables_setup extends "Purchases & Payables Setup"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,TFS180484

    layout
    {

        //
        addafter("Posted Credit Memo Nos.")
        {
            field("Indent No."; rec."Indent No.")
            {
                ApplicationArea = all;
            }
            field("Indent No.1"; rec."Indent No.1")
            {
                ApplicationArea = all;
            }

            field("Posted Forward Commission"; rec."Posted Forward Commission")
            {
            }
        }

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

