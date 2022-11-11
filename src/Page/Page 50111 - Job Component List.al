page 50111 "Job Component List"
{
    // version PCPL-FA-1.0

    CardPageID = "Job Component Card";
    PageType = List;
    SourceTable = 50036;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("FA No."; rec."FA No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("FA Description"; rec."FA Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Maintenance Type"; rec."Maintenance Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Period; rec.Period)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Blocked; rec.Blocked)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

