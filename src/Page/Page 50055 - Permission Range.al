page 50055 "Permission Range"
{
    PageType = List;
    SourceTable = 2000000044;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type"; rec."Object Type")
                {
                    ApplicationArea = ALL;
                }
                field(Index; rec.Index)
                {
                    ApplicationArea = ALL;
                }
                field(From; rec.From)
                {
                    ApplicationArea = ALL;
                }
                field("To"; rec."To")
                {
                    ApplicationArea = ALL;
                }
                field("Read Permission"; rec."Read Permission")
                {
                    ApplicationArea = ALL;
                }
                field("Insert Permission"; rec."Insert Permission")
                {
                    ApplicationArea = ALL;
                }
                field("Modify Permission"; rec."Modify Permission")
                {
                    ApplicationArea = ALL;
                }
                field("Delete Permission"; rec."Delete Permission")
                {
                    ApplicationArea = ALL;
                }
                field("Execute Permission"; rec."Execute Permission")
                {
                    ApplicationArea = ALL;
                }
                field("Limited Usage Permission"; rec."Limited Usage Permission")
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

