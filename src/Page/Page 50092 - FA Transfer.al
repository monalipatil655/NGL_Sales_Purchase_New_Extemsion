page 50092 "FA Transfer"
{
    // version PCPL0017

    PageType = List;
    SourceTable = 50069;
    SourceTableView = WHERE(Completed = CONST(false));

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
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = all;
                }
                field("FA Description"; rec."FA Description")
                {
                    ApplicationArea = all;
                }
                field("Transfer Date"; rec."Transfer Date")
                {
                    ApplicationArea = all;
                }
                field("From FA Location"; rec."From FA Location")
                {
                    ApplicationArea = all;
                }
                field("To FA Location"; rec."To FA Location")
                {
                    ApplicationArea = all;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = all;
                }
                field(Completed; rec.Completed)
                {
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE;
                    end;
                }
                field("Entry Created On"; rec."Entry Created On")
                {
                    ApplicationArea = all;
                }
                field("From Location"; rec."From Location")
                {
                    ApplicationArea = all;
                }
                field("To Location"; rec."To Location")
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

