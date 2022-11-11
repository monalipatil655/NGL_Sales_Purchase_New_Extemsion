tableextension 50069 Purch_head_Archive extends "Purchase Header Archive"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484

    fields
    {



        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

            //Unsupported feature: Change OptionString on ""GST Vendor Type"(Field 16609)". Please convert manually.

        }


        field(50001; "Port of Loading"; Text[30])
        {
        }
        field(50002; "Place of Discharge"; Text[50])
        {
        }
        field(50004; "Qty Discount Value"; Decimal)
        {
            Description = 'Sh 24.05.11';
        }
        field(50005; "Qty Discount Type"; Option)
        {
            Description = 'Sh 24.05.11';
            OptionCaption = 'Per KG,Percentage';
            OptionMembers = "Per KG",Percentage;
        }
        field(50006; "Delivery Schedule"; Text[80])
        {
            Description = 'mayuri';
        }
        field(50008; "Payment terms"; Text[50])
        {
            Description = 'FOR IMPORT PO';
        }
        field(50009; "INCO Terms"; Option)
        {
            Description = 'sh 17.08.11';
            OptionCaption = 'EX WORKS,FCA - Free Carrier,CPT - Carriage,CIP - Carriage And Insurance,DAT - Delivered At Terminal,DAP - Delivered At Place,DDP - Delivered Duty Paid,FAS - Free Alongside Ship,FOB - Free On Board,CFR - Cost And Freight,CIF - Cost Insurance And Freight';
            OptionMembers = "EX WORKS","FCA - Free Carrier","CPT - Carriage","CIP - Carriage And Insurance","DAT - Delivered At Terminal","DAP - Delivered At Place","DDP - Delivered Duty Paid","FAS - Free Alongside Ship","FOB - Free On Board","CFR - Cost And Freight","CIF - Cost Insurance And Freight";
        }
        field(50010; "Shiping Agent Code"; Code[20])
        {
            TableRelation = "Shipping Agent";
        }
        field(50011; "LR No."; Code[20])
        {
        }
        field(50012; "LR Date"; Date)
        {
        }
        field(50020; Remark; Text[50])
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
            OptionCaption = 'KAPL Insurance Policy,Vendor Insurance Policy';
            OptionMembers = "KAPL Insurance Policy","Vendor Insurance Policy";
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
        }
        field(50037; "Indent Date"; Date)
        {
        }
        field(50038; "Freight-Terms"; Option)
        {
            Description = 'Gunjan';
            OptionCaption = 'To your A/C,To Our A/C';
            OptionMembers = "To your A/C","To Our A/C";
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
        field(50117; "Port of Loading1"; Code[20])
        {
            Description = 'amk';
            // TableRelation = Table50060;
        }
        field(50118; "Port of Delivery"; Code[20])
        {
            Description = 'amk';
            //TableRelation = Table50060;
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
            // TableRelation = Table50060.Field4;

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

    //Unsupported feature: PropertyChange. Please convert manually.

}

