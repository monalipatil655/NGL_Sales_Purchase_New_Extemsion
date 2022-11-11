page 50065 "Forex Three"
{
    // version PCPL/BRB/006

    PageType = List;
    SourceTable = 50038;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Bank ref"; rec."Bank ref")
                {
                    ApplicationArea = ALL;
                }
                field("Export Invoice No."; rec."Export Invoice No.")
                {
                    ApplicationArea = ALL;
                }
                field(Buyer; rec.Buyer)
                {
                    ApplicationArea = ALL;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field("Invoice Value"; rec."Invoice Value")
                {
                    ApplicationArea = ALL;
                }
                field("Received Amt"; rec."Received Amt")
                {
                    ApplicationArea = ALL;
                }
                field("Exc rate"; rec."Exc rate")
                {
                    ApplicationArea = ALL;
                }
                field("Utili. Date/Cancel Date"; rec."Utili. Date/Cancel Date")
                {
                    ApplicationArea = ALL;
                }
                field("Contract Status"; rec."Contract Status")
                {
                    ApplicationArea = ALL;
                }
                field("Pre utilisation Rate"; rec."Pre utilisation Rate")
                {
                    ApplicationArea = ALL;
                }
                field("Spot Rate on Date of Util."; rec."Spot Rate on Date of Util.")
                {
                    ApplicationArea = ALL;
                }
                field("Forward contract"; rec."Forward contract")
                {
                    ApplicationArea = ALL;
                }
                field("Contract Amount"; rec."Contract Amount")
                {
                    ApplicationArea = ALL;
                }
                field(Utilized; rec.Utilized)
                {
                    ApplicationArea = ALL;
                }
                field("Contract Amt Bal"; rec."Contract Amt Bal")
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
    }
}

