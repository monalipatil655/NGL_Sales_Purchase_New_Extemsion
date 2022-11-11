pageextension 50009 Vendor_list extends "Vendor List"
{
    // version NAVW19.00.00.45778

    layout
    {




        addafter("Fax No.")
        {
            field("MSME Registered"; rec."MSME Registered")
            {
                ApplicationArea = all;

            }

        }
        addafter(Contact)
        {
            field("E-Mail1"; rec."E-Mail1")
            {
                ApplicationArea = all;
            }
            field("E-Mail2"; rec."E-Mail2")
            {
                ApplicationArea = all;
            }
        }

        addafter("Base Calendar Code")
        {
            field(Address; rec.Address)
            {
                ApplicationArea = all;
            }
            field("Address 2"; rec."Address 2")
            {
                ApplicationArea = all;
            }
            field(City; rec.City)
            {
                ApplicationArea = all;
            }
            field("State Code"; rec."State Code")
            {
                ApplicationArea = all;
            }

        }
    }
    actions
    {


        // addafter("Vendor - Detail Trial Balance")
        // {
        //     action("Balance Approval Mail")
        //     {
        //         //RunObject = Report 50071; //NSW07
        //         ApplicationArea = all;
        //     }
        // }
    }


}

