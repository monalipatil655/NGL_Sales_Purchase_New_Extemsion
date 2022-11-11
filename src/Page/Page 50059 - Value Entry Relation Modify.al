page 50059 "Value Entry Relation Modify"
{
    PageType = List;
    Permissions = TableData 6508 = rimd;
    SourceTable = 6508;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Value Entry No."; rec."Value Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Source RowId"; rec."Source RowId")
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

