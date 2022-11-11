pageextension 50043 Reservation_entried extends "Reservation Entries"
{
    // version NAVW19.00.00.45778,PCPL/NGL/002

    layout
    {
        addafter("Creation Date")
        {
            field("External Lot No."; rec."External Lot No.")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {

        //Unsupported feature: PropertyDeletion on "CancelReservation(Action 64)". Please convert manually.

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

