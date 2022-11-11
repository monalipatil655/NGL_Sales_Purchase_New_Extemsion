page 50112 "Job Component Card"
{
    // version PCPL-FA-1.0

    PageType = Card;
    SourceTable = 50036;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = all;
                }
                field(Period; rec.Period)
                {
                    ApplicationArea = all;
                }
                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = all;
                }
                field("FA Description"; rec."FA Description")
                {
                    ApplicationArea = all;
                }
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Daily Job"; rec."Daily Job")
                {
                    ApplicationArea = all;
                }
                field("Next Job Date"; rec."Next Job Date")
                {
                    ApplicationArea = all;
                }
                field("Created By"; rec."Created By")
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field("Maintenance Type"; rec."Maintenance Type")
                {
                    ApplicationArea = all;
                }
            }
            part(NewPart; 50071)
            {
                SubPageLink = "FA No." = FIELD("FA No."),
                              Period = FIELD(Period),
                              "Maintenance Type" = FIELD("Maintenance Type");
            }
        }
    }

    actions
    {
    }
}

