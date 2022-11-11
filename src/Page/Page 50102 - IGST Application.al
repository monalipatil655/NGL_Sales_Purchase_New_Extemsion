page 50102 "IGST Application"
{
    // version //PCPL-25-IGSTAppl

    PageType = List;
    Permissions = TableData 112 = rimd;
    SourceTable = 112;
    SourceTableView = WHERE("Remaining GST Amount" = FILTER(> 0));

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
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Original GST Amount"; rec."Original GST Amount")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Applied GST Amount"; rec."Applied GST Amount")
                {
                    ApplicationArea = all;
                }
                field("Remaining GST Amount"; rec."Remaining GST Amount")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Rounding Amount"; rec."Rounding Amount")
                {
                    ApplicationArea = all;
                }
                field("Applied GST Document No."; rec."Applied GST Document No.")
                {
                    ApplicationArea = all;
                }
                field("Rounding G/L"; rec."Rounding G/L")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        SalesInvoiceLine: Record 113;
        SalesInvoiceHeader: Record 112;
}

