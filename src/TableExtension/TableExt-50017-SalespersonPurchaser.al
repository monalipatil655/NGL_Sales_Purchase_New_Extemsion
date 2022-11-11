tableextension 50017 SalespersonPurchase_ext extends "Salesperson/Purchaser"
{
    // version NAVW19.00.00.45778

    fields
    {

        //Unsupported feature: Change Data type on "Code(Field 1)". Please convert manually.


        //Unsupported feature: Deletion on ""Privacy Blocked"(Field 150)". Please convert manually.

        field(50001; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

