table 50069 "FA Transfer - Functionality"
{
    // version PCPL0017


    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "FA No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate();
            begin
                FixedAsset.GET("FA No.");
                "FA Description" := FixedAsset.Description;
                "From FA Location" := FixedAsset."FA Location Code";
                "From Location" := FixedAsset."Location Code";
            end;
        }
        field(3; "FA Description"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Transfer Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "From FA Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "FA Location".Code;
        }
        field(6; "To FA Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Location".Code;
        }
        field(7; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Completed; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD("FA No.");
                TESTFIELD("To Location");
                TESTFIELD("To FA Location");
                TESTFIELD("Transfer Date");

                FixedAsset.GET("FA No.");
                IF Completed = TRUE THEN
                    FixedAsset."FA Location Code" := "To FA Location";
                FixedAsset."Location Code" := "To Location";
                FixedAsset.MODIFY;
            end;
        }
        field(9; "Entry Created On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "From Location"; Code[10])
        {
            Editable = false;
            TableRelation = Location.Code;
        }
        field(11; "To Location"; Code[10])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Entry Created On" := TODAY;
        "User ID" := USERID;
    end;

    var
        FixedAsset: Record 5600;
}

