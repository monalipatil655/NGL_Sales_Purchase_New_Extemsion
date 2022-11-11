page 50067 "Forex two"
{
    // version PCPL/BRB/006

    Caption = 'Forex two';
    PageType = List;
    SourceTable = 50039;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Date of Booking"; rec."Date of Booking")
                {
                    ApplicationArea = all;
                }
                field("Forward No."; rec."Forward No.")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Past Performance Balance"; rec."Past Performance Balance")
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Remaining Performance Balance"; rec."Remaining Performance Balance")
                {
                    ApplicationArea = all;
                }
                field("Maturity  Date"; rec."Maturity  Date")
                {
                    ApplicationArea = all;
                }
                field("Fwd Exchage Rate"; rec."Fwd Exchage Rate")
                {
                    ApplicationArea = all;
                }
                field("Spot Rate at time of booking"; rec."Spot Rate at time of booking")
                {
                    ApplicationArea = all;
                }
                field(Premium; rec.Premium)
                {
                    ApplicationArea = all;
                }
                field("Utilisation Date"; rec."Utilisation Date")
                {
                    ApplicationArea = all;
                }
                field("Utilized in export"; rec."Utilized in export")
                {
                    ApplicationArea = all;
                }
                field("Pre-utilization rate"; rec."Pre-utilization rate")
                {
                    ApplicationArea = all;
                }
                field("Pre-util.Charges(pro-rata)"; rec."Pre-util.Charges(pro-rata)")
                {
                    ApplicationArea = all;
                }
                field("Spot rate at the time of util."; rec."Spot rate at the time of util.")
                {
                    ApplicationArea = all;
                }
                field("Profit/Loss"; rec."Profit/Loss")
                {
                    ApplicationArea = all;
                }
                field("Remaining Amount"; rec."Remaining Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

