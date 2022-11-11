page 50098 "Forward Utilisation Pcpl"
{
    PageType = List;
    Permissions = TableData 50038 = rimd;
    SourceTable = 50098;

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
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Bank ref"; rec."Bank ref")
                {
                    ApplicationArea = all;
                }
                field("Export Invoice No."; rec."Export Invoice No.")
                {
                    ApplicationArea = all;
                }
                field(Buyer; rec.Buyer)
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Invoice Value"; rec."Invoice Value")
                {
                    ApplicationArea = all;
                }
                field("Received Amt"; rec."Received Amt")
                {
                    ApplicationArea = all;
                }
                field("Exc rate"; rec."Exc rate")
                {
                    ApplicationArea = all;
                }
                field("Utili. Date/Cancel Date"; rec."Utili. Date/Cancel Date")
                {
                    ApplicationArea = all;
                }
                field("Contract Status"; rec."Contract Status")
                {
                    ApplicationArea = all;
                }
                field("Pre utilisation Rate"; rec."Pre utilisation Rate")
                {
                    ApplicationArea = all;
                }
                field("Spot Rate on Date of Util."; rec."Spot Rate on Date of Util.")
                {
                    ApplicationArea = all;
                }
                field("Forward contract"; rec."Forward contract")
                {
                    ApplicationArea = all;
                }
                field("Contract Amount"; rec."Contract Amount")
                {
                    ApplicationArea = all;
                }
                field(Utilized; rec.Utilized)
                {
                    ApplicationArea = all;
                }
                field("Contract Amt Bal"; rec."Contract Amt Bal")
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

