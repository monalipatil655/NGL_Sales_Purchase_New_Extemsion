page 50093 "Completed FA Transfer"
{
    // version PCPL0017

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 50069;
    SourceTableView = WHERE(Completed = CONST(true));

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
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = ALL;
                }
                field("FA Description"; rec."FA Description")
                {
                    ApplicationArea = ALL;
                }
                field("Transfer Date"; rec."Transfer Date")
                {
                    ApplicationArea = ALL;
                }
                field("From FA Location"; rec."From FA Location")
                {
                    ApplicationArea = ALL;
                }
                field("To FA Location"; rec."To FA Location")
                {
                    ApplicationArea = ALL;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = ALL;
                }
                field(Completed; rec.Completed)
                {
                    ApplicationArea = ALL;
                }
                field("Entry Created On"; rec."Entry Created On")
                {
                    ApplicationArea = ALL;
                }
                field("From Location"; rec."From Location")
                {
                    ApplicationArea = ALL;
                }
                field("To Location"; rec."To Location")
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

