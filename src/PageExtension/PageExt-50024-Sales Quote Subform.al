pageextension 50024 Sales_Quote_Subform extends "Sales Quote Subform"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466

    layout
    {


        addafter("Inv. Discount Amount")
        {
            field("Lost Quote Status"; rec."Lost Quote Status")
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin
                    //PCPL 38
                    IF rec."Lost Quote Status" = TRUE THEN BEGIN
                        SalesCommentLine.RESET;
                        SalesCommentLine.SETRANGE("Document Type", rec."Document Type");
                        SalesCommentLine.SETRANGE("No.", rec."Document No.");
                        SalesCommentLine.SETRANGE("Document Line No.", rec."Line No.");
                        IF NOT SalesCommentLine.FINDFIRST THEN
                            ERROR('Please update comments');
                    END;
                    //PCPL 38
                end;
            }
        }
    }
    actions
    {


    }

    var
        SalesCommentLine: Record 44;

    procedure ShowLineComments();
    begin
        ShowLineComments;
    end;


    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

