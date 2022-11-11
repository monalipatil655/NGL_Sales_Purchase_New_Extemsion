page 50097 "Job Maintenance List"
{
    // version PCPL-FA-1.0

    CardPageID = "FA Transfer";
    Editable = false;
    PageType = List;
    SourceTable = 50035;
    SourceTableView = WHERE(Status = CONST(Created));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
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
                field(Status; rec.Status)
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
                field("Location Code"; rec."Location Code")
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
                field("Created By"; rec."Created By")
                {
                    ApplicationArea = all;
                }
                field("Prod.main. Date"; rec."Prod.main. Date")
                {
                    ApplicationArea = all;
                }
                field("Approver ID"; rec."Approver ID")
                {
                    ApplicationArea = all;
                }
                field(Approval; rec.Approval)
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

