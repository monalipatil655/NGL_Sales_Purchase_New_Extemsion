table 50036 "Job Component Header"
{
    // version PCPL-FA-1.0

    Caption = 'Maintenance Header';

    fields
    {
        field(1; "FA No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate();
            begin
                IF recFA.GET("FA No.") THEN
                    "FA Description" := recFA.Description;
            end;
        }
        field(2; "FA Description"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Under Maintenance,Close';
            OptionMembers = "Under Maintenance",Close;
        }
        field(8; Remarks; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                IF Vendor.GET("Vendor No.") THEN
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(10; "Vendor Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Maintenance Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive Maintenance,Miscellaneouse Job,Statutory Compliance Job,AMC Job,Break Down,calibration';
            OptionMembers = "Preventive Maintenance","Miscellaneouse Job","Statutory Compliance Job","AMC Job","Break Down",calibration;
        }
        field(12; Period; DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                IF "Daily Job" = TRUE THEN
                    ERROR('Daily Job must be False for mentioning Period');
            end;
        }
        field(13; Blocked; Boolean)
        {
            CaptionML = ENU = 'Blocked',
                        ENN = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(14; "Next Job Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Daily Job"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                /*
                IF Period <> 0D THEN
                  ERROR('If Period is defined then you can not select Daily Job option');
                  */

            end;
        }
    }

    keys
    {
        key(Key1; "FA No.", Period, "Maintenance Type")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "FA No.", "FA Description", "End Date")
        {
        }
    }

    trigger OnInsert();
    begin
        "Created By" := USERID;
        "Creation Date" := TODAY;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FASetup: Record 5603;
        recFA: Record 5600;
        Vendor: Record 23;
}

