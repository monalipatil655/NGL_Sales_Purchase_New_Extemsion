page 50069 "Attachment Resolve"
{
    PageType = List;
    SourceTable = 130;

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
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Created Date-Time"; rec."Created Date-Time")
                {
                    ApplicationArea = all;
                }
                field("Created By User ID"; rec."Created By User ID")
                {
                    ApplicationArea = all;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Created By User Name"; rec."Created By User Name")
                {
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
                {
                    ApplicationArea = all;
                }
                field("Last Modified By User ID"; rec."Last Modified By User ID")
                {
                    ApplicationArea = all;
                }
                field("Last Modified By User Name"; rec."Last Modified By User Name")
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

