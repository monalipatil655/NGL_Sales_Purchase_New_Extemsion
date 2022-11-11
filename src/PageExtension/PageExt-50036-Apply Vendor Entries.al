pageextension 50036 Apply_vendor_Entries extends "Apply Vendor Entries"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316

    layout
    {


        addfirst(Control1)
        {
            field("Applies-to ID"; rec."Applies-to ID")
            {
                Visible = "Applies-to IDVisible";
                ApplicationArea = all;
            }

        }
    }
    actions
    {

    }
    var
        "Applies-to IDVisible": Boolean;
        PurchHeader: Record 38;
        VendEntryEdit: Codeunit 113;


    trigger OnOpenPage()
    begin
        "Applies-to IDVisible" := TRUE;
        "Applies-to IDVisible" := ApplnType <> ApplnType::"Applies-to Doc. No.";
    end;

}

