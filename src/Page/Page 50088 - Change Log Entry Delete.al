page 50088 "Change Log Entry Delete"
{
    PageType = List;
    Permissions = TableData 405 = rimd;
    SourceTable = 405;

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
                field("Date and Time"; rec."Date and Time")
                {
                    ApplicationArea = all;
                }
                field(Time; Time)
                {
                    ApplicationArea = all;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Table No."; rec."Table No.")
                {
                    ApplicationArea = all;
                }
                field("Table Caption"; rec."Table Caption")
                {
                    ApplicationArea = all;
                }
                field("Field No."; rec."Field No.")
                {
                    ApplicationArea = all;
                }
                field("Field Caption"; rec."Field Caption")
                {
                    ApplicationArea = all;
                }
                field("Type of Change"; rec."Type of Change")
                {
                    ApplicationArea = all;
                }
                field("Old Value"; rec."Old Value")
                {
                    ApplicationArea = all;
                }
                field("New Value"; rec."New Value")
                {
                    ApplicationArea = all;
                }
                field("Primary Key"; rec."Primary Key")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 1 No."; rec."Primary Key Field 1 No.")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 1 Caption"; rec."Primary Key Field 1 Caption")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 1 Value"; rec."Primary Key Field 1 Value")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 2 No."; rec."Primary Key Field 2 No.")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 2 Caption"; rec."Primary Key Field 2 Caption")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 2 Value"; rec."Primary Key Field 2 Value")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 3 No."; rec."Primary Key Field 3 No.")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 3 Caption"; rec."Primary Key Field 3 Caption")
                {
                    ApplicationArea = all;
                }
                field("Primary Key Field 3 Value"; rec."Primary Key Field 3 Value")
                {
                    ApplicationArea = all;
                }
                field("Record ID"; rec."Record ID")
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

