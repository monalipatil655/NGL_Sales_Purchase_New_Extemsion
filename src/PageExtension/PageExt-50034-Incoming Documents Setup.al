pageextension 50034 Incoming_Doc_setup extends "Incoming Documents Setup"
{
    // version NAVW17.10,pcpl0024_Inc_Doc

    layout
    {
        addafter("Require Approval To Create")
        {
            field("Sales Path"; rec."Sales Path")
            {
                ApplicationArea = all;
            }
            field("Purchase Path"; rec."Purchase Path")
            {
                ApplicationArea = all;
            }
            field("Bank Receipt"; rec."Bank Receipt")
            {
                ApplicationArea = all;
            }
            field("Vendor Path"; rec."Vendor Path")
            {
                ApplicationArea = all;
            }
            field("Customer Path"; rec."Customer Path")
            {
                ApplicationArea = all;
            }
            field("Indent Path"; rec."Indent Path")
            {
                ApplicationArea = all;
            }
            field("Finished Production Path"; rec."Finished Production Path")
            {
                ApplicationArea = all;
            }
            field("Posted Inspection Path"; rec."Posted Inspection Path")
            {
                ApplicationArea = all;
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

