page 50123 "Raw Material Price Subpage"
{
    // version //PCPL AntiCost

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 50051;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No"; rec."Item No")
                {
                    ApplicationArea = all;
                }
                field("Item Description"; rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field(UOM; rec.UOM)
                {
                    ApplicationArea = all;
                }
                field("Last Unit Price"; rec."Last Unit Price")
                {
                    ApplicationArea = all;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        RawMaterialPricelistheader.RESET;
        RawMaterialPricelistheader.SETRANGE("No.", rec."Document No.");
        IF RawMaterialPricelistheader.FINDFIRST THEN BEGIN
            rec."Location Code" := RawMaterialPricelistheader."Location Code";
            rec."Item Category Code" := RawMaterialPricelistheader."Item Category Code";
        END;
    end;

    var
        RawMaterialPricelistheader: Record 50050;
}

