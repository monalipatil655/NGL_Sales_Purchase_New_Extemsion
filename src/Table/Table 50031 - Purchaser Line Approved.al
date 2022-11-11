table 50031 "Purchaser Line Approved"
{
    // version NAVW19.00.00.48316,PCPL/BRB/006

    CaptionML = ENU = 'Item Vendor',
                ENN = 'Item Vendor';
    DrillDownPageID = 50066;
    LookupPageID = 50066;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.',
                        ENN = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Vendor No."; Code[20])
        {
            CaptionML = ENU = 'Vendor No.',
                        ENN = 'Vendor No.';
            NotBlank = true;
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                IF Vend.GET("Vendor No.") THEN
                    "Vendor Name" := Vend.Name;
            end;
        }
        field(3; "Vendor Name"; Text[60])
        {
        }
        field(6; "Lead Time Calculation"; DateFormula)
        {
            CaptionML = ENU = 'Lead Time Calculation',
                        ENN = 'Lead Time Calculation';
        }
        field(7; "Vendor Item No."; Text[20])
        {
            CaptionML = ENU = 'Vendor Item No.',
                        ENN = 'Vendor Item No.';
        }
        field(10; Location; Code[20])
        {
            TableRelation = Location;
        }
        field(5700; "Variant Code"; Code[10])
        {
            CaptionML = ENU = 'Variant Code',
                        ENN = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(5701; "Send Mail"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Item No.")
        {
        }
        key(Key2; "Item No.", "Variant Code", "Vendor No.")
        {
        }
        key(Key3; "Vendor No.", "Vendor Item No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //DeleteItemCrossReference;
    end;

    trigger OnRename();
    begin
        //UpdateItemCrossReference;
    end;

    var
        Vend: Record 23;
        ItemCrossReference: Record 5717;
        DistIntegration: Codeunit 5702;
        LeadTimeMgt: Codeunit 5404;
}

