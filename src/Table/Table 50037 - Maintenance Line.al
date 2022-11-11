table 50037 "Maintenance Line"
{
    // version PCPL-FA-1.0


    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Component Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '" ,FA,Item,G/L Account"';
            OptionMembers = " ",FA,Item,"G/L Account";

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);
            end;
        }
        field(4; Component; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Component Type" = CONST(FA)) "Fixed Asset"
            ELSE
            IF ("Component Type" = CONST(Item)) Item
            ELSE
            IF ("Component Type" = CONST("G/L Account")) "G/L Account" WHERE("Direct Posting" = CONST(true),
                                                                                             "Account Type" = CONST(Posting),
                                                                                             Blocked = CONST(false));

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);

                IF Item.GET(Component) THEN BEGIN
                    Description := Item.Description;
                    "Description 2" := Item."Description 2";
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                END;
                IF GLAccount.GET(Component) THEN
                    Description := GLAccount.Name;
                IF FixedAsset.GET(Component) THEN BEGIN
                    Description := FixedAsset.Description;
                    "Description 2" := FixedAsset."Description 2";
                    "Unit of Measure Code" := '';
                END;
            end;
        }
        field(5; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);
            end;
        }
        field(6; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);
            end;
        }
        field(7; "Bin Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"));

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);
                CLEAR(vBinQty);
                WarehouseEntry.RESET;
                WarehouseEntry.SETRANGE("Item No.", Component);
                WarehouseEntry.SETRANGE("Location Code", "Location Code");
                WarehouseEntry.SETRANGE("Bin Code", "Bin Code");
                IF WarehouseEntry.FINDFIRST THEN
                    REPEAT
                        vBinQty += WarehouseEntry.Quantity;
                    UNTIL WarehouseEntry.NEXT = 0;
                "Inventory  Qty" := vBinQty;
            end;
        }
        field(8; "Inventory  Qty"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD(Component),
                                                                  "Location Code" = FIELD("Location Code")));
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                IF MaintenanceHeader.GET("Document No.") THEN
                    MaintenanceHeader.TESTFIELD(Status, MaintenanceHeader.Status::Created);
            end;
        }
        field(9; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Quantity Utilized"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD(Component),
                                                                   "Job Card Ref." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(12; "Req no."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Req Line no."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Variant Code"; Code[10])
        {
            TableRelation = IF ("Component Type" = FILTER(Item)) "Item Variant".Code WHERE("Item No." = FIELD(Component));

            trigger OnValidate();
            begin
                //PCPL-25
                ItemVariant.RESET;
                ItemVariant.SETRANGE(ItemVariant.Code, "Variant Code");
                ItemVariant.SETRANGE(ItemVariant."Item No.", Component);
                IF ItemVariant.FINDFIRST THEN BEGIN
                    Description := ItemVariant.Description;
                    "Description 2" := ItemVariant."Description 2";
                END;
                //PCPL-25
            end;
        }
        field(15; "Description 2"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF ("Component Type" = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD(Component))
            ELSE
            "Unit of Measure";

            trigger OnValidate();
            var
                UnitOfMeasureTranslation: Record 5402;
            begin
            end;
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

    trigger OnInsert();
    begin
        //PCPL-25
        IF MaintenanceHeader.GET("Document No.") THEN BEGIN
            "Location Code" := MaintenanceHeader."Location Code"
        END;
        //PCPL-25
    end;

    var
        WarehouseEntry: Record 7312;
        vBinQty: Decimal;
        ReserveItemJnlLine: Codeunit 99000835;
        ReserveItemJnlLine1: Codeunit 50000;
        MaintenanceHeader: Record 50035;
        Item: Record 27;
        GLAccount: Record 15;
        FixedAsset: Record 5600;
        ItemVariant: Record 5401;

    procedure OpenItemTrackingLines(IsReclass: Boolean);
    begin
        ReserveItemJnlLine1.CallItemTrackingML(Rec, IsReclass);
    end;
}

