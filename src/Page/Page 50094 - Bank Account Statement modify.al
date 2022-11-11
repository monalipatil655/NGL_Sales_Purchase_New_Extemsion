page 50094 "Bank Account Statement modify"
{
    PageType = List;
    Permissions = TableData 275 = rimd;
    SourceTable = 275;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bank Account No."; rec."Bank Account No.")
                {
                    ApplicationArea = all;
                }
                field("Statement No."; rec."Statement No.")
                {
                    ApplicationArea = all;
                }
                field("Statement Ending Balance"; rec."Statement Ending Balance")
                {
                    ApplicationArea = all;
                }
                field("Statement Date"; rec."Statement Date")
                {
                    ApplicationArea = all;
                }
                field("Balance Last Statement"; rec."Balance Last Statement")
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

