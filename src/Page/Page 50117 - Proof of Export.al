page 50117 "Proof of Export"
{
    // version PCPL-25/proofExp

    Editable = false;
    PageType = List;
    SourceTable = 113;
    SourceTableView = WHERE("Proof of Export" = FILTER(true),
                           "GST Group Code" = FILTER('GST 0.1%'));
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Proof of Export"; rec."Proof of Export")
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

