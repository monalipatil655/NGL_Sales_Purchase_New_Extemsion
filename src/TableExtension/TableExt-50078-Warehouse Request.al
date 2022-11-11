tableextension 50078 Warehouse_request extends "Warehouse Request"
{
    // version NAVW19.00.00.45778,GITLEXIM

    fields
    {
        field(50000; "Vendor Name"; Text[50])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Destination No.")));
            Description = 'Sanjay 06/12/2014';
            FieldClass = FlowField;
        }
        field(50001; "Customer Name"; Text[50])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Destination No.")));
            Description = 'Sanjay 06/12/2014';
            FieldClass = FlowField;
        }
        field(50002; "Item Description"; Text[100])
        {
            CalcFormula = Lookup("Purchase Line".Description WHERE("Document No." = FIELD("Source No.")));
            Description = 'Sanjay 06/12/14';
            FieldClass = FlowField;
        }
        field(50003; "Item Id"; Code[10])
        {
            CalcFormula = Lookup("Purchase Line"."No." WHERE("Document No." = FIELD("Source No.")));
            Description = 'Sanjay 06/12/14';
            FieldClass = FlowField;
        }
        field(50004; "Closed PO"; Boolean)
        {
            CalcFormula = Lookup("Purchase Header"."Closed PO" WHERE("Document Type" = FILTER(Order),
                                                                      "No." = FIELD("Source No.")));
            FieldClass = FlowField;
        }
        field(33000990; "Export Document"; Boolean)
        {
            Description = 'GITLEXim';
        }
        field(33000991; "Import Document"; Boolean)
        {
            Description = 'GITLEXim';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

