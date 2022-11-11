table 50050 "Raw Material Price list header"
{
    // version //PCPL AntiCost

    //DrillDownPageID = 50121;
    //LookupPageID = 50121;

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

            trigger OnValidate();
            begin
                RawMaterialPricelistLine.RESET;
                RawMaterialPricelistLine.SETRANGE(RawMaterialPricelistLine."Document No.", "No.");
                IF RawMaterialPricelistLine.FINDSET THEN
                    REPEAT
                        RawMaterialPricelistLine."Location Code" := "Location Code";
                        RawMaterialPricelistLine.MODIFY;
                    UNTIL RawMaterialPricelistLine.NEXT = 0;
            end;
        }
        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(6; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";

            trigger OnValidate();
            begin
                RawMaterialPricelistLine.RESET;
                RawMaterialPricelistLine.SETRANGE(RawMaterialPricelistLine."Document No.", "No.");
                IF RawMaterialPricelistLine.FINDSET THEN
                    REPEAT
                        RawMaterialPricelistLine."Item Category Code" := "Item Category Code";
                        RawMaterialPricelistLine.MODIFY;
                    UNTIL RawMaterialPricelistLine.NEXT = 0;
            end;
        }
        field(7; "Created By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Released By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Remarks; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Blocked; Boolean)
        {
            CaptionML = ENU = 'Blocked',
                        ENN = 'Blocked';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IF "No." = '' THEN BEGIN
            PurchasesPayablesSetup.GET;
            PurchasesPayablesSetup.TESTFIELD("RMPM Nos");
            "No." := NoSeriesMgt.GetNextNo(PurchasesPayablesSetup."RMPM Nos", WORKDATE, TRUE);
            "No. Series" := PurchasesPayablesSetup."RMPM Nos";
        END;
        "Created By" := USERID;
        "Creation Date" := TODAY;
    end;

    var
        PurchasesPayablesSetup: Record 312;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vendor: Record 23;
        RawMaterialPricelistLine: Record 50051;
}

