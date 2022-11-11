table 50046 "Formulation BOM Line"
{
    // version //PCPL AntiCost

    CaptionML = ENU = 'Formulation BOM Line',
                ENN = 'Production BOM Line';

    fields
    {
        field(1; "Formulation BOM No."; Code[20])
        {
            CaptionML = ENU = 'Formulation BOM No.',
                        ENN = 'Formulation BOM No.';
            NotBlank = true;
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = ENU = 'Line No.',
                        ENN = 'Line No.';
        }
        field(10; Type; Option)
        {
            CaptionML = ENU = 'Type',
                        ENN = 'Type';
            NotBlank = true;
            OptionCaptionML = ENU = ' ,Item',
                              ENN = ' ,Item';
            OptionMembers = " ",Item;

            trigger OnValidate();
            begin
                TestStatus;

                xRec.Type := Type;

                INIT;
                Type := xRec.Type;
            end;
        }
        field(11; "No."; Code[20])
        {
            CaptionML = ENU = 'No.',
                        ENN = 'No.';
            TableRelation = Item;

            trigger OnValidate();
            begin
                TESTFIELD(Type);

                TestStatus;

                CASE Type OF
                    Type::Item:
                        BEGIN
                            Item.GET("No.");
                            Description := Item.Description;
                            Item.TESTFIELD("Base Unit of Measure");
                            "Unit of Measure Code" := Item."Base Unit of Measure";
                            "Scrap %" := Item."Scrap %";
                            IF "No." <> xRec."No." THEN
                                "Variant Code" := '';
                        END;
                END;
            end;
        }
        field(12; Description; Text[50])
        {
            CaptionML = ENU = 'Description',
                        ENN = 'Description';
        }
        field(13; "Unit of Measure Code"; Code[10])
        {
            CaptionML = ENU = 'Unit of Measure Code',
                        ENN = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate();
            begin
                TESTFIELD("No.");
                IF xRec."Unit of Measure Code" <> "Unit of Measure Code" THEN
                    TESTFIELD(Type, Type::Item);
            end;
        }
        field(14; Quantity; Decimal)
        {
            CaptionML = ENU = 'Quantity',
                        ENN = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(18; "Lead-Time Offset"; DateFormula)
        {
            CaptionML = ENU = 'Lead-Time Offset',
                        ENN = 'Lead-Time Offset';

            trigger OnValidate();
            begin
                TESTFIELD("No.");
            end;
        }
        field(19; "Routing Link Code"; Code[10])
        {
            CaptionML = ENU = 'Routing Link Code',
                        ENN = 'Routing Link Code';
            TableRelation = "Routing Link";

            trigger OnValidate();
            begin
                IF "Routing Link Code" <> '' THEN BEGIN
                    TESTFIELD(Type, Type::Item);
                    TESTFIELD("No.");
                END;
            end;
        }
        field(20; "Scrap %"; Decimal)
        {
            BlankNumbers = BlankNeg;
            CaptionML = ENU = 'Scrap %',
                        ENN = 'Scrap %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;

            trigger OnValidate();
            begin
                TESTFIELD("No.");
            end;
        }
        field(21; "Variant Code"; Code[10])
        {
            CaptionML = ENU = 'Variant Code',
                        ENN = 'Variant Code';
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate();
            begin
                IF "Variant Code" = '' THEN
                    EXIT;
                TESTFIELD(Type, Type::Item);
                TESTFIELD("No.");
            end;
        }
        field(28; "Starting Date"; Date)
        {
            CaptionML = ENU = 'Starting Date',
                        ENN = 'Starting Date';

            trigger OnValidate();
            begin
                TESTFIELD("No.");

                IF "Starting Date" > 0D THEN
                    VALIDATE("Ending Date");
            end;
        }
        field(29; "Ending Date"; Date)
        {
            CaptionML = ENU = 'Ending Date',
                        ENN = 'Ending Date';

            trigger OnValidate();
            begin
                TESTFIELD("No.");

                IF ("Ending Date" > 0D) AND
                   ("Starting Date" > 0D) AND
                   ("Starting Date" > "Ending Date")
                THEN
                    ERROR(
                      Text000,
                      FIELDCAPTION("Ending Date"),
                      FIELDCAPTION("Starting Date"));
            end;
        }
        field(40; Length; Decimal)
        {
            CaptionML = ENU = 'Length',
                        ENN = 'Length';
            DecimalPlaces = 0 : 5;

            trigger OnValidate();
            begin
                VALIDATE("Calculation Formula");
            end;
        }
        field(41; Width; Decimal)
        {
            CaptionML = ENU = 'Width',
                        ENN = 'Width';
            DecimalPlaces = 0 : 5;

            trigger OnValidate();
            begin
                VALIDATE("Calculation Formula");
            end;
        }
        field(42; Weight; Decimal)
        {
            CaptionML = ENU = 'Weight',
                        ENN = 'Weight';
            DecimalPlaces = 0 : 5;

            trigger OnValidate();
            begin
                VALIDATE("Calculation Formula");
            end;
        }
        field(43; Depth; Decimal)
        {
            CaptionML = ENU = 'Depth',
                        ENN = 'Depth';
            DecimalPlaces = 0 : 5;

            trigger OnValidate();
            begin
                VALIDATE("Calculation Formula");
            end;
        }
        field(44; "Calculation Formula"; Option)
        {
            CaptionML = ENU = 'Calculation Formula',
                        ENN = 'Calculation Formula';
            OptionCaptionML = ENU = ' ,Length,Length * Width,Length * Width * Depth,Weight',
                              ENN = ' ,Length,Length * Width,Length * Width * Depth,Weight';
            OptionMembers = " ",Length,"Length * Width","Length * Width * Depth",Weight;

            trigger OnValidate();
            begin
                TESTFIELD("No.");

                CASE "Calculation Formula" OF
                    "Calculation Formula"::" ":
                        Quantity := "Quantity per";
                    "Calculation Formula"::Length:
                        Quantity := ROUND(Length * "Quantity per", 0.00001);
                    "Calculation Formula"::"Length * Width":
                        Quantity := ROUND(Length * Width * "Quantity per", 0.00001);
                    "Calculation Formula"::"Length * Width * Depth":
                        Quantity := ROUND(Length * Width * Depth * "Quantity per", 0.00001);
                    "Calculation Formula"::Weight:
                        Quantity := ROUND(Weight * "Quantity per", 0.00001);
                END;
            end;
        }
        field(45; "Quantity per"; Decimal)
        {
            CaptionML = ENU = 'Quantity per',
                        ENN = 'Quantity per';
            DecimalPlaces = 0 : 5;

            trigger OnValidate();
            begin
                VALIDATE("Calculation Formula");
            end;
        }
        field(60; "Previous Qty. Per"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(16500; "Principal Input"; Boolean)
        {
            CaptionML = ENU = 'Principal Input',
                        ENN = 'Principal Input';
            Editable = false;
        }
        field(50000; "Include Scrap"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = '2';
        }
        field(50001; "Has BOM"; Boolean)
        {
            CalcFormula = Exist("Formulation BOM Header" WHERE("Item Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50002; "Cost Per Unit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "Cost Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; Manufacturing; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Formulation BOM No.", "Line No.")
        {
        }
        key(Key2; Type, "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        ProdBOMComment: Record 99000776;
        PlanningAssignment: Record 99000850;
        //BOMChangeLog : Record 16534; //PCPL/NSW/MIG 08Jule22
        Item: Record 27;
        EntryNo: Integer;
    begin
    end;

    trigger OnInsert();
    begin
        TestStatus;
    end;

    trigger OnModify();
    begin
        IF Type <> Type::" " THEN
            TestStatus;
    end;

    var
        Text000: TextConst ENU = '%1 must be later than %2.', ENN = '%1 must be later than %2.';
        Item: Record 27;
        FormBOMHeader: Record 50045;
        Text16500: TextConst ENU = 'The Comment has not been entered yet for BOM No. %1. Do you want to enter Comment for this BOM ?', ENN = 'The Comment has not been entered yet for BOM No. %1. Do you want to enter Comment for this BOM ?';
        BOMVersionUOMErr: TextConst Comment = '%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code', ENU = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4.', ENN = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4.';
        BOMHeaderUOMErr: TextConst Comment = '%1=UOM Code;%2=Item No.;%3=Production BOM No.', ENU = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3.', ENN = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3.';
        BOMLineUOMErr: TextConst Comment = '%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code;%5=Line No.', ENU = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4, Line No. = %5.', ENN = 'The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4, Line No. = %5.';

    local procedure TestStatus();
    var
        ProdBOMVersion: Record 99000779;
    begin
        FormBOMHeader.GET("Formulation BOM No.");
        IF FormBOMHeader.Status = FormBOMHeader.Status::Certified THEN
            FormBOMHeader.FIELDERROR(Status);
    end;
}

