page 50071 "Job Component Lines"
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
                field("Component Type"; rec."Component Type")
                {
                    ApplicationArea = all;
                }
                field(Component; rec.Component)
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; rec."Variant Code")
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
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
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

