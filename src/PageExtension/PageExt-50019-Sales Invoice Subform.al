pageextension 50019 Sales_Invoice_Subform extends "Sales Invoice Subform"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466

    layout
    {

        addafter("Line Amount")
        {
            // field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = all;
            }
        }
        addafter(Quantity)
        {
            field("Qty. to Ship"; rec."Qty. to Ship")
            {
                ApplicationArea = all;
            }
        }

    }
    actions
    {
    }
    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

