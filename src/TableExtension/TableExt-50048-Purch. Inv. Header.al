tableextension 50048 Purch_Inv_Header_ext extends "Purch. Inv. Header"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484

    fields
    {



        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

        }


        field(50000; Freight; Option)
        {
            Description = 'KAR1.0';
            OptionMembers = " ","To Pay",Paid;
        }
        field(50001; "Port of Loading"; Text[30])
        {
        }
        field(50002; "Place of Discharge"; Text[50])
        {
        }
        field(50003; Warranty; Text[30])
        {
        }
        field(50006; "Delivery Schedule"; Text[80])
        {
            Caption = 'Delivery Terms';
            Description = 'mayuri';
        }
        field(50008; "Payment terms"; Text[50])
        {
            Description = 'FOR IMPORT PO';
        }
        field(50009; "Invoiced Received at HO"; Boolean)
        {
        }
        field(50025; "Shipment Agent Code"; Code[20])
        {
            Description = 'Setu Dated: 13-Feb-13';
            TableRelation = "Shipping Agent";
        }
        field(50027; "Freight Amount"; Text[50])
        {
            Description = 'Gunjan';
        }
        field(50028; Insurance; Option)
        {
            Description = 'Gunjan';
            OptionCaption = 'NGL Insurance Policy,Vendor Insurance Policy';
            OptionMembers = "NGL Insurance Policy","Vendor Insurance Policy";
        }
        field(50029; "Quotation No"; Text[30])
        {
            Description = 'sanjay';
        }
        field(50031; "Dispatch Schedule"; Text[100])
        {
            Description = 'Gunjan';
        }
        field(50038; Postingdatetime; DateTime)
        {
            Description = 'Sanjay for time 11/12/2015';
        }
        field(50039; PackingDetails; Text[249])
        {
            Description = 'sanjay for packing list update 29/07/2016';
        }
        field(50040; "GRN No from line"; Text[50])
        {
            CalcFormula = Lookup("Purch. Inv. Line".Description WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        /* //PCPL/NSW/MIG  12July22
        field(50041; "BED Amount"; Decimal)
        {
            CalcFormula = Lookup("Purch. Inv. Line"."BED Amount" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50042; "AED Amount"; Decimal)
        {
            CalcFormula = Lookup("Purch. Inv. Line"."ADE Amount" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50043; "Excise amount"; Decimal)
        {
            CalcFormula = Lookup("Purch. Inv. Line"."Excise Amount" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        */ //PCPL/NSW/MIG  12July22
        field(50044; "Mode of Freight Payment"; Text[15])
        {
            Description = 'Gunjan';
        }
        field(50050; "Vendor Date"; Date)
        {
        }
    }

    var
        PostPurchLinesDelete: Codeunit 364;
}

