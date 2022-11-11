table 50035 "Maintenance Header"
{
    // version PCPL-FA-1.0

    Caption = 'Maintenance Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "FA No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
                IF recFA.GET("FA No.") THEN
                    "FA Description" := recFA.Description;
                IF "FA No." = '' THEN
                    "FA Description" := '';
            end;
        }
        field(3; "FA Description"; Text[80])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(4; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(7; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
                //PCPL-25
                MaintenanceLine.RESET;
                MaintenanceLine.SETRANGE(MaintenanceLine."Document No.", "No.");
                IF MaintenanceLine.FINDSET THEN
                    REPEAT
                        MaintenanceLine."Location Code" := "Location Code";
                        MaintenanceLine.MODIFY;
                    UNTIL MaintenanceLine.NEXT = 0;
                //PCPL-25
            end;
        }
        field(8; "Created By"; Code[80])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Created,Under Maintenance,Close';
            OptionMembers = Created,"Under Maintenance",Close;
        }
        field(10; Remarks; Text[80])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Created);
            end;
        }
        field(11; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                IF Vendor.GET("Vendor No.") THEN
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(12; "Vendor Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Maintenance Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive Maintenance,Miscellaneouse Job,Statutory Compliance Job,AMC Job,Break Down,calibration';
            OptionMembers = "Preventive Maintenance","Miscellaneouse Job","Statutory Compliance Job","AMC Job","Break Down",calibration;
        }
        field(14; "Incoming Document Entry No."; Integer)
        {
            CaptionML = ENU = 'Incoming Document Entry No.',
                        ENN = 'Incoming Document Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Incoming Document";

            trigger OnValidate();
            var
                IncomingDocument: Record 130;
            begin
                IF "Incoming Document Entry No." = xRec."Incoming Document Entry No." THEN
                    EXIT;
                IF "Incoming Document Entry No." = 0 THEN
                    IncomingDocument.RemoveReferenceToWorkingDocument(xRec."Incoming Document Entry No.")
                ELSE
                    IncomingDocument.SetMHDoc(Rec);
            end;
        }
        field(15; "PO Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; Daily; Boolean)
        {
            Editable = false;
        }
        field(17; "Prod.main. Date"; Date)
        {
        }
        field(18; "Approver ID"; Text[50])
        {
            Editable = false;
        }
        field(19; Approval; Boolean)
        {

            trigger OnValidate();
            begin
                IF Approval THEN BEGIN
                    "Approver ID" := USERID;

                    //SMTPMailSetup.GET;

                    Usersetup.GET("Created By");
                    //VarEmailSender := SMTPMailSetup."User ID";
                    //VarRecipaint := 'itmumbai@nglfinechem.com';//Usersetup."E-Mail";

                    // SMTP.CreateMessage('', VarEmailSender, VarRecipaint1, 'Maintenance job ' + FORMAT("No.") + ' ' + FORMAT("FA Description"), '', TRUE);
                    // SMTP.AppendBody('Dear Team,');
                    // SMTP.AppendBody('<p>');
                    // SMTP.AppendBody('Please find the below ');
                    // SMTP.AppendBody('<br><br>');
                    // SMTP.AppendBody('<table border="1">');
                    // SMTP.AppendBody('<th>  Job No </th>');
                    // SMTP.AppendBody('<th>  Machine Name</th>');
                    // SMTP.AppendBody('<th> Prod. Maintenance Date </th>');
                    // SMTP.AppendBody('<th> Appoval By </th>');
                    // SMTP.AppendBody('</tr>')
                    // SMTP.AppendBody('<tr>');
                    // SMTP.AppendBody('<td>' + "No." + '</td>');
                    // SMTP.AppendBody('<td>' + "FA Description" + '</td>');
                    // SMTP.AppendBody('<td>' + FORMAT("Prod.main. Date") + '</td>');
                    // SMTP.AppendBody('<td>' + "Approver ID" + '</td>');
                    // SMTP.AppendBody('</tr>');
                    // SMTP.AppendBody('</table>');
                    // SMTP.AppendBody('<br><br>');
                    // SMTP.AppendBody('Regards,');
                    // SMTP.AppendBody('<br><br>');
                    // SMTP.AppendBody(CompanyInformation.Name);
                    // SMTP.AppendBody('<br>');
                    // SMTP.Send;


                    VarRecipaint1.add('itmumbai@nglfinechem.com');
                    BodyText.AddText('Dear Team,');
                    BodyText.AddText('<p>');
                    BodyText.AddText('Please find the below ');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('<table border="1">');
                    BodyText.AddText('<th>  Job No </th>');
                    BodyText.AddText('<th>  Machine Name</th>');
                    BodyText.AddText('<th> Prod. Maintenance Date </th>');
                    BodyText.AddText('<th> Appoval By </th>');
                    BodyText.AddText('</tr>');
                    BodyText.AddText('<tr>');
                    BodyText.AddText('<td>' + "No." + '</td>');
                    BodyText.AddText('<td>' + "FA Description" + '</td>');
                    BodyText.AddText('<td>' + FORMAT("Prod.main. Date") + '</td>');
                    BodyText.AddText('<td>' + "Approver ID" + '</td>');
                    BodyText.AddText('</tr>');
                    BodyText.AddText('</table>');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('Regards,');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText(CompanyInformation.Name);
                    BodyText.AddText('<br>');


                    EmailMessage.Create(VarRecipaint1, 'Maintenance job', Format(BodyText), true);
                    EMail1.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    //MESSAGE('The mail has been sent successfully');
                end;
            end;


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
        fieldgroup(DropDown; "No.", "FA No.", "Start Date")
        {
        }
    }

    trigger OnInsert();
    begin
        IF "No." = '' THEN BEGIN
            FASetup.GET;
            FASetup.TESTFIELD("Maintenance Nos.");
            "No." := NoSeriesMgt.GetNextNo(FASetup."Maintenance Nos.", WORKDATE, TRUE);
        END;
        "Created By" := USERID;
        "Creation Date" := TODAY;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FASetup: Record 5603;
        recFA: Record 5600;
        Vendor: Record 23;
        MaintenanceLine: Record 50037;
        Usersetup: Record 91;
        // SMTP: Codeunit 400;
        VarEmailSender: Text;
        VarRecipaint: Text;
        VarRecipaint1: List of [text];
        //SMTPMailSetup: Record 409;
        CompanyInformation: Record 79;
        EmailMessage: Codeunit "Email Message";
        EMail1: Codeunit Email;
        BodyText: BigText;
}

