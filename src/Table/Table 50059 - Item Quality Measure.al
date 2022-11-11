table 50059 "Item Quality Measure"
{
    // version RSPL/QC/V3/001,PCPL/NGL/001


    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'Begin,Posting,End';
            OptionMembers = "Begin",Posting,"End";
        }
        field(4; "Qlty Measure Code"; Code[10])
        {
            Caption = 'Quality Measure Code';
            NotBlank = true;
            TableRelation = "Quality Measure";

            trigger OnValidate();
            begin

                QltyMeasure.GET("Qlty Measure Code");
                Description := QltyMeasure.Description;
                Qualitative := QltyMeasure.Qualitative;
                "Unit of Measure" := QltyMeasure."Unit of Measure";
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Description = 'length increase from 50 to 100 sanjay 22/12/2014';
        }
        field(6; "Min. Value"; Decimal)
        {
            Caption = 'Min. Value';
            DecimalPlaces = 0 : 5;
        }
        field(7; "Max. Value"; Decimal)
        {
            Caption = 'Max. Value';
            DecimalPlaces = 0 : 5;
        }
        field(8; "Mean Tolerance"; Decimal)
        {
            Caption = 'Mean Tolerance';
            DecimalPlaces = 0 : 5;
        }
        field(9; "Text Value"; Text[200])
        {
        }
        field(10; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(11; Qualitative; Boolean)
        {
        }
        field(12; "Test Manadatory"; Boolean)
        {
        }
        field(13; "Test Method"; Text[50])
        {
        }
        field(14; "Laboratory Details"; Text[50])
        {
        }
        field(15; "Specification No"; Text[30])
        {
        }
        field(16; "Item Description"; Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(17; Location; Code[20])
        {
            TableRelation = Location.Code;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        QltyMeasure: Record 99000785;
}

