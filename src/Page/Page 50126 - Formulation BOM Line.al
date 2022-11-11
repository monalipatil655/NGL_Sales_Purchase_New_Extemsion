page 50126 "Formulation BOM Line"
{
    // version //PCPL AntiCost

    AutoSplitKey = true;
    Caption = 'BOM/Other BOM Line';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = 50046;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = all;
                }
                field("Quantity per"; rec."Quantity per")
                {
                    ApplicationArea = all;
                }
                field("Previous Qty. Per"; rec."Previous Qty. Per")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount"; rec."Cost Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    var
        recUserSetup: Record 91;
}

