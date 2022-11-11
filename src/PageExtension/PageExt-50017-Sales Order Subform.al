pageextension 50017 Sales_Order_Subform extends "Sales Order Subform"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,PCPL/QC/V3/001

    layout
    {

        addafter(Description)
        {


            field("Assessee Code"; rec."Assessee Code")
            {
                ApplicationArea = all;
            }

        }
    }


    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

