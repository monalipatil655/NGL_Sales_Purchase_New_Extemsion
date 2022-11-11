tableextension 50034 Sales_inv_Header_1 extends "Sales Invoice Header"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484,//PCPL-25-IGSTAppl,PCPL41-EWAY

    fields
    {


        modify("GST Customer Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted', ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted';

            //Unsupported feature: Change OptionString on ""GST Customer Type"(Field 16602)". Please convert manually.

        }
        modify("Invoice Type")
        {
            OptionCaptionML = ENU = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST', ENN = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST';

            //Unsupported feature: Change OptionString on ""Invoice Type"(Field 16605)". Please convert manually.

        }


        field(50001; "Buyer Reference No.1"; Text[50])
        {
            Caption = 'Buyer Reference No.';
            Description = 'Sanjay 21/11/2015 for buyer ref. no linked to Sales Header';
        }
        field(50002; "Electronic Reference No."; Text[30])
        {
            Description = 'Sanjay 21/11/2015 for Overseas Bankd Details linked to Sales Header Export';
        }
        field(50003; "Indian Bank Details"; Text[200])
        {
            Description = 'Sanjay 21/11/2015 for Indian Bank Details linked to Sales Header Export';
        }
        field(50004; "UNDER DRAWBACK"; Text[50])
        {
            Description = 'Sanjay 21/11/2015 for Under DrawBack  linked to Sales Header Export';
        }
        field(50005; "Delivery Term"; Text[50])
        {
            Description = 'Sanjay Deliver term from header 11/12/2015';
        }
        field(50010; "Export Freight"; Decimal)
        {
        }
        field(50011; "CHA Charges"; Decimal)
        {
        }
        field(50034; "Buyer Reference No."; Text[50])
        {
            Caption = 'Buyer Reference No.';
            Description = 'Sanjay 26/12/2014';
            Editable = true;
        }
        field(50036; Incoterms; Text[250])
        {
            Caption = 'INCOTERMS';
            Description = 'Sanjay 05/02/2015';
        }
        field(50037; "Bank Ref No."; Text[20])
        {
        }
        field(50038; "Original GST Amount"; Decimal)
        {
            Description = '//PCPL-25';
        }
        field(50039; "Remaining GST Amount"; Decimal)
        {
            Description = '//PCPL-25';
        }
        field(50040; "Applied GST Amount"; Integer)
        {
            Description = '//Pcp-25';

            trigger OnValidate();
            begin
                //PCPL-25-IGSTAppl
                IF "Applied GST Amount" <> 0 THEN BEGIN
                    IF ("Applied GST Amount" + "Rounding Amount") > "Remaining GST Amount" THEN
                        ERROR('Applied GST amount & Rounding amount should not be greater than remaining GST amount');
                END;
                IF "Applied GST Document No." <> '' THEN BEGIN
                    ERROR('Applied GST Document Number is already exist.');
                END;
                //PCPL-25-IGSTAppl
            end;
        }
        field(50041; "Applied GST Document No."; Code[20])
        {
            Description = '//PCPL-25';
        }
        field(50042; "Rounding Amount"; Decimal)
        {
            Description = '//PCPL-25';

            trigger OnValidate();
            begin
                //PCPL-25-IGSTAppl
                IF "Applied GST Amount" <> 0 THEN BEGIN
                    IF ("Applied GST Amount" + "Rounding Amount") > "Remaining GST Amount" THEN
                        ERROR('Applied GST amount & Rounding amount should not be greater than remaining GST amount');
                END;

                IF "Rounding Amount" <> 0 THEN BEGIN
                    "Rounding G/L" := '403240';
                END
                ELSE
                    "Rounding G/L" := '';
                MODIFY;
                //PCPL-25-IGSTAppl
            end;
        }
        field(50043; "Rounding G/L"; Code[8])
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
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }
    }
    var
        PostSalesLinesDelete: Codeunit 363;
}

