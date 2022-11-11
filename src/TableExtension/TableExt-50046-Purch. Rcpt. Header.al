tableextension 50046 Purch_Rcpt_Header_ext extends "Purch. Rcpt. Header"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484

    fields
    {


        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

            //Unsupported feature: Change OptionString on ""GST Vendor Type"(Field 16609)". Please convert manually.

        }
        modify("GST Input Service Distribution")
        {
            CaptionML = ENU = 'GST Input Service Distribution';
        }


        field(50000; Freight; Option)
        {
            Description = 'KAR1.0';
            OptionMembers = " ","To Pay",Paid;
        }
        field(50002; "Manufacturer Name"; Text[60])
        {
        }
        field(50003; "Manufacturer Address"; Text[60])
        {
        }
        field(50010; "COA No"; Text[30])
        {
            CalcFormula = Lookup("Inspection Data Sheet"."Certificate No." WHERE("GRN No." = FIELD("No.")));
            Description = 'sanjay 28/11/2016';
            FieldClass = FlowField;
        }
        field(50011; "LR No."; Code[20])
        {
        }
        field(50012; "LR Date"; Date)
        {
        }
        field(50013; "Item Description"; Text[100])
        {
            CalcFormula = Lookup("Purch. Rcpt. Line".Description WHERE("Document No." = FIELD("No.")));
            Description = 'Sanjay 14/04/2015';
            FieldClass = FlowField;
        }
        field(50014; "Item Code"; Text[30])
        {
            CalcFormula = Lookup("Purch. Rcpt. Line"."No." WHERE("Document No." = FIELD("No.")));
            Description = 'Sanjay 14/04/2015';
            FieldClass = FlowField;
        }
        field(50015; "GRN Qty"; Decimal)
        {
            CalcFormula = Lookup("Purch. Rcpt. Line".Quantity WHERE("Document No." = FIELD("No.")));
            Description = 'Sanjay 14/04/2015';
            FieldClass = FlowField;
        }
        field(50030; "Total Import Charges"; Decimal)
        {
        }
        field(50035; "Special condition"; Text[100])
        {
        }
        field(50036; "Indent No"; Code[20])
        {
            Enabled = false;
        }
        field(50037; "Indent Date"; Date)
        {
            Enabled = false;
        }
        field(50038; Postingdatetime; DateTime)
        {
            AccessByPermission = TableData 120 = M;
            Description = 'Sanjay for time 11/12/2015';
        }
        field(50039; PackingDetails; Text[249])
        {
            Description = 'Sanjay date 26/07/2016';
        }
        field(50050; "Vendor Date"; Date)
        {
        }
        field(99008500; "Date Received"; Date)
        {
            Caption = 'Date Received';
        }
        field(99008501; "Time Received"; Time)
        {
            Caption = 'Time Received';
        }
        field(99008509; "Date Sent"; Date)
        {
            Caption = 'Date Sent';
            Enabled = false;
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

