table 50051 "Raw Material Price list Line"
{
    // version //PCPL AntiCost


    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Item No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("Item Category Code" = FIELD("Item Category Code"));

            trigger OnValidate();
            begin
                IF recItem.GET("Item No") THEN
                    "Item Description" := recItem.Description;

                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("No.", "Item No");
                PurchInvLine.SETRANGE("Location Code", "Location Code");
                IF PurchInvLine.FINDLAST THEN
                    "Last Unit Price" := PurchInvLine."Unit Price (LCY)";

                IF "Last Unit Price" = 0 THEN BEGIN
                    recILE.RESET;
                    recILE.SETRANGE("Item No.", "Item No");
                    recILE.SETRANGE("Location Code", "Location Code");
                    IF recILE.FINDLAST THEN
                        "Last Unit Price" := recILE."Qty. per Unit of Measure";
                END;
            end;
        }
        field(4; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Item Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7; UOM; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Last Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        recItem: Record 27;
        RawMaterialPricelistheader: Record 50050;
        PurchInvLine: Record 123;
        recILE: Record 32;
}

