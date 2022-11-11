pageextension 50064 Bank_receipt_Voucher extends "Bank Receipt Voucher"
{
    // version NAVIN7.10,TFS180484

    layout
    {


    }
    actions
    {

        addafter("Apply Entries")
        {
            action("IGST Application")
            {
                RunObject = Page 50102;
                ApplicationArea = all;
            }
        }



    }



}

