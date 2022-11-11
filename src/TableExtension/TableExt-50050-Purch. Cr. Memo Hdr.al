tableextension 50050 Purch_Cr_memo_hed_ext extends "Purch. Cr. Memo Hdr."
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,KAR1.0,TFS180484

    fields
    {



        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

            //Unsupported feature: Change OptionString on ""GST Vendor Type"(Field 16609)". Please convert manually.

        }


        field(50000; Freight; Option)
        {
            Description = 'KAR1.0';
            OptionMembers = " ","To Pay",Paid;
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
        field(50029; "Mode of Freight Payment"; Text[30])
        {
            Description = 'Gunjan';
        }
        field(50031; "Dispatch Schedule"; Text[100])
        {
            Description = 'Gunjan';
        }
        field(50033; "Quotation Date"; Date)
        {
        }
        field(50034; "Delivery At"; Code[20])
        {
            TableRelation = Location;
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
        field(50038; "Freight-Terms"; Option)
        {
            Description = 'Gunjan';
            OptionCaption = 'To your A/C,To Our A/C';
            OptionMembers = "To your A/C","To Our A/C";
        }
        field(50039; PackingDetails; Text[249])
        {
            Description = 'sanjay for packing list update 29/07/2016';
        }
        field(50050; "Vendor Date"; Date)
        {
        }
        field(50114; "Vessel Name"; Text[30])
        {
            Description = 'amk';
        }
        field(50115; "Vessel Receipt Date"; Date)
        {
            Description = 'amk';
        }
        field(50117; "Port of Loading"; Code[20])
        {
            Description = 'amk';
            //TableRelation = Table50060;  //PCPL/NSW/MIG  12July22 table Not exist
        }
        field(50118; "Port of Delivery"; Code[20])
        {
            Description = 'amk';
            //TableRelation = Table50060;  //PCPL/NSW/MIG  12July22 table Not exist
        }
        field(50119; "Vendor Type"; Option)
        {
            OptionCaption = '" ,Manufacturer,First Stage Dealer,Second Stage Dealer,Importer"';
            OptionMembers = " ",Manufacturer,"First Stage Dealer","Second Stage Dealer",Importer;
        }
        field(50120; "Partial Shipment"; Option)
        {
            Description = 'amk';
            OptionCaption = 'Allowed,Not Allowed';
            OptionMembers = "< "," Allowed","Not Allowed>";
        }
        field(50121; Transshipment; Option)
        {
            Description = 'amk';
            Editable = true;
            OptionCaption = 'Allowed,Not Allowed';
            OptionMembers = "<Allowed","Not Allowed>";
        }
        field(50122; Tolerance; Option)
        {
            OptionCaption = ', +/- 1,+/- 2,+/- 3,+/- 4,+/- 5,+/- 6,+/- 7,+/- 8,+/- 9,+/- 10';
            OptionMembers = ," +/- 1","+/- 2","+/- 3","+/- 4","+/- 5","+/- 6","+/- 7","+/- 8","+/- 9","+/- 10";
        }
        field(50127; "Vendor Order Date"; Date)
        {
            Description = 'amk';
        }
        field(50128; "Forward Contract No."; Code[18])
        {
            Description = 'DCS-07.11.11';
            //TableRelation = Table50060.Field4; //PCPL/NSW/MIG  12July22 table Not exist


            trigger OnValidate();
            begin
                //TESTFIELD(Status,Status::Open); // Gunjan
            end;
        }
        field(50129; "Booked ForwardContract Order"; Boolean)
        {
            Description = 'DCS';
        }
    }




    var
        PostPurchLinesDelete: Codeunit 364;
}

