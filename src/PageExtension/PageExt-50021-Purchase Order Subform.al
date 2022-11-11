pageextension 50021 Purch_order_Subform extends "Purchase Order Subform"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,GITLEXIM,PCPL/QC/V3/001

    layout
    {



        addafter("Inv. Discount Amount")
        {
            field("Qty Send to Quality"; rec."Qty Send to Quality")
            {
                ApplicationArea = all;
            }
            field("Qty in Quality"; rec."Qty in Quality")
            {
                ApplicationArea = all;
            }
            field("Qty Accepted"; rec."Qty Accepted")
            {
                ApplicationArea = all;
            }
            field("Qty Rejected"; rec."Qty Rejected")
            {
                ApplicationArea = all;
            }

            field(Status; rec.Status)
            {
                ApplicationArea = all;
            }

            field("Quotation No"; rec."Quotation No")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {

        // addafter(OrderTracking)
        // {
        //     action("Comparison Report")
        //     {
        //         Image = "Report";

        //         trigger OnAction();
        //         var
        //             recquatationrec: Record 50032;
        //         begin
        //             // recpurchseline.RESET;
        //             // recpurchseline.SETRANGE("Document No.","No.");
        //             // IF recpurchseline.FINDSET THEN REPEAT
        //             recquatationrec.RESET;
        //             recquatationrec.SETRANGE(recquatationrec."Document No.", "Indent No.");
        //             recquatationrec.SETRANGE(recquatationrec."No.", "No.");//pcpl0024_24jan2019
        //             recquatationrec.SETRANGE(recquatationrec."Line No.", "Quatation recieved Line No.");//PCPL0024_12Feb2019
        //             IF recquatationrec.FINDFIRST THEN
        //                 REPORT.RUNMODAL(50070, TRUE, FALSE, recquatationrec);
        //             //UNTIL recpurchseline.NEXT=0
        //         end;
        //     }
        // }

    }



    var

        PurchHeader1: Record 38;
        Qty: Integer;



    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        rec.ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;



    procedure Update1();
    begin
        //001 Start
        CurrPage.UPDATE;
        //001 End
    end;

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

