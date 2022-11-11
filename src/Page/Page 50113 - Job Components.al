page 50113 "Job Components"
{
    // version PCPL-FA-1.0

    PageType = List;
    SourceTable = 50000;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = all;
                }
                field("Component Type"; rec."Component Type")
                {
                    ApplicationArea = all;
                }
                field(Component; rec.Component)
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Period; rec.Period)
                {
                    ApplicationArea = all;
                }
                field("Maintenance Type"; rec."Maintenance Type")
                {
                    ApplicationArea = all;
                }
                field(Select; rec.Select)
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

