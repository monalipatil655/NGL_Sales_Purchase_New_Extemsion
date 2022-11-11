page 50114 "Maintenance List"
{
    // version PCPL-FA-1.0

    CardPageID = "Job Maintenance Header";
    PageType = List;
    SourceTable = 50035;
    SourceTableView = WHERE(Status = FILTER(Created));

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
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
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

