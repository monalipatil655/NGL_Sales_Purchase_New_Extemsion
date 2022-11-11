page 50124 "Formulation BOM List"
{
    // version //PCPL AntiCost

    Caption = 'Standard BOM List';
    CardPageID = "Formulatiom BOM";
    PageType = List;
    SourceTable = 50045;
    SourceTableView = WHERE(Status = FILTER(<> Closed),
                            "Standard BOM" = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = ALL;
                }
                field("Item Code"; rec."Item Code")
                {
                    ApplicationArea = ALL;
                }
                field("Item Description"; rec."Item Description")
                {
                    ApplicationArea = ALL;
                }
                field("Item Category"; rec."Item Category")
                {
                    ApplicationArea = ALL;
                }
                field("Product Group Code"; rec."Product Group Code")
                {
                    ApplicationArea = ALL;
                }
                field("Avg. Weight"; rec."Avg. Weight")
                {
                    ApplicationArea = ALL;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = ALL;
                }
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = ALL;
                }
                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = ALL;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = ALL;
                }
                field("Created By User ID"; rec."Created By User ID")
                {
                    ApplicationArea = ALL;
                }
                field("Approved On"; rec."Approved On")
                {
                    ApplicationArea = ALL;
                }
                field("Approved By"; rec."Approved By")
                {
                    ApplicationArea = ALL;
                }
                field(View; rec.View)
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
    }

    var
        ObjID: Code[10];
        recUserSetup: Record 91;
        CatCodeFilter: Code[250];
        Cnt: Integer;
}

