table 50000 "Component Lines"
{
    // version PCPL-FA-1.0

    DrillDownPageID = 50006;
    LookupPageID = 50006;

    fields
    {
        field(1; "FA No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Component Header"."FA No." WHERE(Period = FIELD(Period),
                                                                   "Maintenance Type" = FIELD("Maintenance Type"));
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(3; "Component Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",FA,Item;
        }
        field(4; Component; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Component Type" = CONST(FA)) "Fixed Asset"."No."
            ELSE
            IF ("Component Type" = CONST(Item)) Item."No.";

            trigger OnValidate();
            begin
                IF "Component Type" = "Component Type"::FA THEN BEGIN
                    IF recFA.GET(Component) THEN BEGIN
                        Description := recFA.Description;
                        "Description 2" := recFA."Description 2";
                        "Unit of Measure Code" := '';
                    END
                END ELSE
                    IF "Component Type" = "Component Type"::Item THEN BEGIN
                        IF recItem.GET(Component) THEN BEGIN
                            Description := recItem.Description;
                            "Description 2" := recItem."Description 2";
                            "Unit of Measure Code" := recItem."Base Unit of Measure";
                        END;
                    END
            end;
        }
        field(5; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Period; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Maintenance Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive Maintenance,Miscellaneouse Job,Statutory Compliance Job,AMC Job,Break Down,calibration';
            OptionMembers = "Preventive Maintenance","Miscellaneouse Job","Statutory Compliance Job","AMC Job","Break Down",calibration;
        }
        field(9; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Variant Code"; Code[10])
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
        field(11; "Description 2"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unit of Measure Code"; Code[10])
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
        key(Key1; "FA No.", "Line No.", Period, "Maintenance Type", "Component Type")
        {
        }
    }

    fieldgroups
    {
    }

    var
        recFA: Record 5600;
        recItem: Record 27;
        ItemVariant: Record 5401;
}

