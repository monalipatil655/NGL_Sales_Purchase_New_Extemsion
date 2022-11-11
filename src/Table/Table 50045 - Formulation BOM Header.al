table 50045 "Formulation BOM Header"
{
    // version //PCPL AntiCost

    CaptionML = ENU = 'Formulation BOM Header',
                ENN = 'Formulation BOM Header';
    DataCaptionFields = "No.", "Item Description";
    DrillDownPageID = 50124;
    LookupPageID = 50124;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.',
                        ENN = 'No.';
        }
        field(8; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Sent for Approval,Approved,Rejected';
            OptionMembers = Open,"Sent for Approval",Approved,Rejected;
        }
        field(22; "Low-Level Code"; Integer)
        {
            CaptionML = ENU = 'Low-Level Code',
                        ENN = 'Low-Level Code';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Creation Date"; Date)
        {
            CaptionML = ENU = 'Creation Date',
                        ENN = 'Creation Date';
            Editable = false;
        }
        field(43; "Last Date Modified"; Date)
        {
            CaptionML = ENU = 'Last Date Modified',
                        ENN = 'Last Date Modified';
            Editable = false;
        }
        field(45; Status; Option)
        {
            CaptionML = ENU = 'Status',
                        ENN = 'Status';
            OptionCaptionML = ENU = 'New,Certified,Under Development,Closed',
                              ENN = 'New,Certified,Under Development,Closed';
            OptionMembers = New,Certified,"Under Development",Closed;

            trigger OnValidate();
            var
                PlanningAssignment: Record 99000850;
                MfgSetup: Record 99000765;
                ProdBOMCheck: Codeunit 99000769;
            begin
                IF Status = Status::"Under Development" THEN BEGIN
                    "Approval Status" := "Approval Status"::Open;
                END;

                IF Status = Status::Certified THEN BEGIN
                    TESTFIELD("Item Code");
                    TESTFIELD(Location);
                END;

                IF Status = Status::Certified THEN BEGIN
                    "Certified By User ID" := USERID;
                    "Certified DateTime" := CURRENTDATETIME;

                END;
            end;
        }
        field(51; "No. Series"; Code[10])
        {
            CaptionML = ENU = 'No. Series',
                        ENN = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(100; "Approval Sender ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Approval Sent On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(102; "Approver ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Seq. No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(104; "Approved On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Approved By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Item Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;

            trigger OnValidate();
            begin
                IF recItem.GET("Item Code") THEN BEGIN
                    "Item Description" := recItem.Description;
                    "Item Category" := recItem."Item Category Code";
                    "Product Group Code" := '';//recItem."Product Group Code";  PCPL/NSW/MIG 25July22
                END
                ELSE BEGIN
                    "Item Description" := '';
                    "Avg. Weight" := 0;
                    "Item Category" := '';
                    "Product Group Code" := '';
                    "Standard BOM" := FALSE;
                END;
            end;
        }
        field(50001; "Item Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Standard BOM"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Avg. Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50004; Location; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50005; "Item Category"; Code[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Product Group".Code WHERE("Item Category Code" = FIELD("Item Category"));
        }
        field(50017; "Created By User ID"; Code[50])
        {
            CaptionML = ENU = 'Created By User ID',
                        ENN = 'Assigned User ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup";
        }
        field(50018; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50019; "Certified By User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50020; "Certified DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50021; "Cost Amount"; Decimal)
        {
            CalcFormula = Sum("Formulation BOM Line"."Cost Amount" WHERE("Formulation BOM No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50050; "Total Quantity"; Decimal)
        {
            CalcFormula = Sum("Formulation BOM Line"."Quantity per" WHERE("Formulation BOM No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50100; "Rejection Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; View; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
        key(Key2; Status, Location)
        {
        }
        key(Key3; "Low-Level Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        PurchSetup.GET;
        IF "No." = '' THEN BEGIN
            PurchSetup.TESTFIELD("Formulation BOM Nos.");
            NoSeriesMgt.InitSeries(PurchSetup."Formulation BOM Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;

        "Creation Date" := TODAY;
        "Standard BOM" := TRUE;
        "Created By User ID" := USERID;
        "Created DateTime" := CURRENTDATETIME;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := TODAY;
    end;

    var
        Text001: TextConst ENU = 'Document successfully released', ENN = 'All versions attached to the BOM will be closed. Close BOM?';
        PurchSetup: Record 312;
        Item: Record 27;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recItem: Record 27;
        recFormBOMLine: Record 50046;
        RMCostSheet: Record 50050;
        RMCostLine: Record 50051;
        recFormHeader: Record 50045;

    procedure CopyBOM(pProdBOMHdr: Record 99000771);
    var
        lFormBOMLine: Record 50046;
        lProdBOMLine: Record 99000772;
    begin
        lProdBOMLine.RESET;
        lProdBOMLine.SETRANGE(lProdBOMLine."Production BOM No.", pProdBOMHdr."No.");
        IF lProdBOMLine.FINDSET THEN
            REPEAT
                lFormBOMLine.INIT;
                lFormBOMLine."Formulation BOM No." := "No.";
                lFormBOMLine."Line No." := lProdBOMLine."Line No.";
                lFormBOMLine.Type := lFormBOMLine.Type::Item;
                lFormBOMLine.VALIDATE("No.", lProdBOMLine."No.");
                lFormBOMLine.VALIDATE("Quantity per", lProdBOMLine."Quantity per");
                lFormBOMLine."Starting Date" := lProdBOMLine."Starting Date";
                lFormBOMLine."Ending Date" := lProdBOMLine."Ending Date";
                lFormBOMLine.INSERT(TRUE);
            UNTIL lProdBOMLine.NEXT = 0;

        CalcRMCost;
    end;

    local procedure CalcRMCost();
    begin
        recFormBOMLine.RESET;
        recFormBOMLine.SETRANGE("Formulation BOM No.", "No.");
        IF recFormBOMLine.FINDSET THEN
            REPEAT
                Item.GET(recFormBOMLine."No.");
                RMCostSheet.RESET;
                RMCostSheet.SETRANGE("Item Category Code", Item."Item Category Code");
                RMCostSheet.SETRANGE("Location Code", Location);
                RMCostSheet.SETRANGE(Status, RMCostSheet.Status::Released);
                IF RMCostSheet.FINDLAST THEN BEGIN
                    RMCostLine.RESET;
                    RMCostLine.SETRANGE("Document No.", RMCostSheet."No.");
                    RMCostLine.SETRANGE("Item No", recFormBOMLine."No.");
                    IF RMCostLine.FINDFIRST THEN BEGIN
                        recFormBOMLine."Previous Qty. Per" := RMCostLine."Unit Price";
                        recFormBOMLine."Cost Amount" := recFormBOMLine."Previous Qty. Per" * recFormBOMLine."Quantity per";
                        recFormBOMLine.MODIFY;
                    END;
                END;
            UNTIL recFormBOMLine.NEXT = 0;
    end;

    procedure AssistEdit(OldFMHeader: Record 50045): Boolean;
    begin
        WITH recFormHeader DO BEGIN
            COPY(Rec);
            PurchSetup.GET;
            PurchSetup.TESTFIELD("Formulation BOM Nos.");
            IF NoSeriesMgt.SelectSeries(PurchSetup."Formulation BOM Nos.", xRec."No. Series", "No. Series") THEN BEGIN
                NoSeriesMgt.SetSeries("No.");
                Rec := recFormHeader;
                EXIT(TRUE);
            END;
        END;
    end;
}

