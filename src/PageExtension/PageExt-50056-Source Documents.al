pageextension 50056 Source_docuemnt extends "Source Documents"
{
    // version NAVW17.00,GITLEXIM

    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Shipment Date")
        {
            Visible = "Shipment DateVisible";
        }

        addafter("Shipment Date")
        {
            field("Item Id"; rec."Item Id")
            {
                ApplicationArea = all;
            }
            field("Item Description"; rec."Item Description")
            {
                ApplicationArea = all;
            }
        }
        addafter("Source Document")
        {
            field("Vendor Name"; rec."Vendor Name")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {


    }

    var
        PH: Record 38;
        "Expected Receipt DateVisible": Boolean;
        "Shipment DateVisible": Boolean;




    trigger OnOpenPage();
    begin
        "Shipment DateVisible" := TRUE;
        "Expected Receipt DateVisible" := TRUE;

        //PCPL-25
        rec.FILTERGROUP(2);
        rec.CALCFIELDS("Closed PO");
        rec.SETFILTER("Closed PO", 'No');
        rec.FILTERGROUP(0);
        //PCPL-25
    end;


    procedure UpdateVisible()
    begin
        "Expected Receipt DateVisible" := rec.Type = rec.Type::Inbound;
        "Shipment DateVisible" := rec.Type = rec.Type::Outbound;
    end;



}

