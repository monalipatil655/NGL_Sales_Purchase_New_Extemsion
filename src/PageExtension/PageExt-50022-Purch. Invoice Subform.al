pageextension 50022 Purch_Invoice_Subform extends "Purch. Invoice Subform"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

    layout
    {



        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                //PCPL/BRB
                IF rec."Receipt No." = '' THEN
                    QtyEditable := TRUE
                ELSE
                    QtyEditable := FALSE;
                //PCPL/BRB      
            end;
        }


    }
    actions
    {



    }



    var
        QtyEditable: Boolean;
        PurchaseHeader: Record 38;

    trigger OnAfterGetCurrRecord()
    begin
        //PCPL/BRB
        IF rec."Receipt No." = '' THEN
            QtyEditable := TRUE
        ELSE
            QtyEditable := FALSE;
        //PCPL/BRB
    end;

    trigger OnAfterGetRecord()
    begin
        //PCPL/BRB
        IF rec."Receipt No." = '' THEN
            QtyEditable := TRUE
        ELSE
            QtyEditable := FALSE;
        //PCPL/BRB
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //PCPL/BRB
        IF rec."Receipt No." = '' THEN
            QtyEditable := TRUE
        ELSE
            QtyEditable := FALSE;
        //PCPL/BRB
    end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

