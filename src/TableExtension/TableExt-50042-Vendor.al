tableextension 50042 Vendor_ext extends Vendor
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,TFS180484,PCPL-FA-1.0,//PCPLTDS194Q

    fields
    {


        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

            //Unsupported feature: Change OptionString on ""GST Vendor Type"(Field 16609)". Please convert manually.

        }


        field(50004; "Qty Discount Value"; Decimal)
        {
            Description = 'Sh 24.05.11';
        }
        field(50005; "Qty Discount Type"; Option)
        {
            Description = 'Sh 24.05.11';
            OptionCaption = ',Per KG,Percentage';
            OptionMembers = ,"Per KG",Percentage;
        }
        field(50006; GTA; Boolean)
        {
            CaptionML = ENU = 'GTA',
                        ENN = 'GTA';
            Description = 'RSPL\EXIM\3.00.1';
        }
        field(50007; Password; Code[20])
        {
            Description = 'PCPL\AN\0026';
        }
        field(50008; "Indent Doc No"; Code[30])
        {
            Description = '//38 PCPL';
        }
        field(50009; Selected; Boolean)
        {
            Description = '//38 PCPL';
        }
        field(50010; "E-Mail1"; Text[80])
        {
            CaptionML = ENU = 'E-Mail1',
                        ENN = 'E-Mail1';
            ExtendedDatatype = EMail;
        }
        field(50011; "E-Mail2"; Text[80])
        {
        }
        field(50012; "Broker Name"; Code[30])
        {
        }
        field(50013; "Broker Email ID"; Text[60])
        {
        }
        field(50014; "MSME Registered"; Boolean)
        {
            Description = 'PallaviG01.03.19';
        }
        field(50015; "TDS Applicable"; Boolean)
        {
            Description = 'PCPLTDS194Q';
        }
        field(50016; "Incoming Document Entry No."; Integer)
        {
            CaptionML = ENU = 'Incoming Document Entry No.',
                        ENN = 'Incoming Document Entry No.';
            DataClassification = ToBeClassified;
            Description = 'PCPLTDS194Q,//PCPL FA';
            TableRelation = "Incoming Document";

            trigger OnValidate();
            var
                IncomingDocument: Record 130;
            begin
                //PCPLTDS194Q
                IF "Incoming Document Entry No." = xRec."Incoming Document Entry No." THEN
                    EXIT;
                IF "Incoming Document Entry No." = 0 THEN
                    IncomingDocument.RemoveReferenceToWorkingDocument(xRec."Incoming Document Entry No.")
                ELSE
                    IncomingDocument.SetVendorDoc(Rec);
                //PCPLTDS194Q
            end;
        }
        field(50017; "TDS  Decleration"; Option)
        {
            Description = 'PCPLTDS194Q';
            OptionCaption = '" ,Yes,No"';
            OptionMembers = " ",Yes,No;

            trigger OnValidate();
            begin
                /*
                //PCPLTDS194Q
                IF "TDS  Decleration" = "TDS  Decleration"::Yes THEN
                  TESTFIELD("Incoming Document Entry No.");
                //PCPLTDS194Q
                */

            end;
        }
        field(50018; "TDS 194Q Applicable"; Boolean)
        {
            Description = 'PCPLTDS194Q';
        }
        field(50019; "Mail count"; Integer)
        {
            Description = 'PCPL-25';
        }
        field(50020; "Balance Approval Mail"; Boolean)
        {
            Description = 'PCPL-25';
        }
        field(50021; "Approval Date"; Date)
        {
            Description = 'PCPL-25';
            FieldClass = Normal;
        }
        field(50022; "Approval Date 2"; Date)
        {
            Description = 'PCPL-25';
        }
    }







    trigger OnInsert()
    begin
        Blocked := Blocked::All;      //PCPL-25
    end;

    var
        NoSeriesCode: Code[10];
}

