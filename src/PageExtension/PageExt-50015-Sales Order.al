pageextension 50015 Sales_Order extends "Sales Order"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,GITLEXIM,PCPL-25/proofExp

    layout
    {
        addafter("Document Date")
        {
            field("Shipping No. Series"; rec."Shipping No. Series")
            {
                ApplicationArea = all;
            }
            field("Shipping No."; rec."Shipping No.")
            {
                ApplicationArea = all;
            }
            field("Posting No. Series"; rec."Posting No. Series")
            {
                ApplicationArea = all;
            }
            field("Posting No."; rec."Posting No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {
            field("Buyer Reference No."; rec."Buyer Reference No.")
            {
                ApplicationArea = all;
            }
            field("Delivery Terms"; rec."Delivery Terms")
            {
                ApplicationArea = all;
            }
            field("Commission Applicable"; rec."Commission Applicable")
            {
                ApplicationArea = all;
            }
        }


    }
    actions
    {

        modify(Release)
        {
            trigger OnBeforeAction()
            begin
                //PCPLTDS194Q
                //TCS - Calculation Update
                //PAN
                Customer.GET(rec."Sell-to Customer No.");
                SalesLine.RESET;
                SalesLine.SETRANGE("Document No.", rec."No.");
                SalesLine.SETRANGE("Document Type", rec."Document Type");
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        IF SalesLine."No." <> '' THEN
                            IF Customer."TCS Applicable" = TRUE THEN
                                SalesLine.TESTFIELD(SalesLine."TCS Nature of Collection");
                        IF Customer.SEZ THEN
                            SalesLine.TESTFIELD("TCS Nature of Collection", '');
                    UNTIL SalesLine.NEXT = 0;
                //PCPLTDS194Q

                //PCPL/0017
                rec.TESTFIELD(rec."Payment Terms Code");
                //PCPL/001
            end;
        }




        //Unsupported feature: CodeModification on "SendApprovalRequest(Action 250).OnAction". Please convert manually.

        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            var
                SalesLine: record 37;
            begin
                //PCPL0017
                //TCS - Calculation Update
                //PAN
                Customer.GET(rec."Sell-to Customer No.");
                SalesLine.RESET;
                SalesLine.SETRANGE("Document No.", rec."No.");
                SalesLine.SETRANGE("Document Type", rec."Document Type");
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        IF SalesLine."No." <> '' THEN
                            IF Customer."TCS Applicable" = TRUE THEN
                                SalesLine.TESTFIELD(SalesLine."TCS Nature of Collection");
                        //PCPLTDS194Q
                        IF Customer.SEZ THEN
                            SalesLine.TESTFIELD("TCS Nature of Collection", '');
                    //PCPLTDS194Q
                    UNTIL SalesLine.NEXT = 0;

            end;
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                //PCPL50
                IF rec."Document Date" <> rec."Posting Date" THEN
                    ERROR('Document Date Should Be Same As Posting Date');
                //PCPL50

                //PCPL-25
                SalesInvoiceHeader.RESET;
                SalesInvoiceHeader.SETRANGE("Sell-to Customer No.", rec."Sell-to Customer No.");
                IF SalesInvoiceHeader.FINDFIRST THEN
                    REPEAT
                        IF TODAY > SalesInvoiceHeader."Posting Date" THEN
                            NoofDays := TODAY - SalesInvoiceHeader."Posting Date";
                        IF NoofDays >= 90 THEN BEGIN
                            SalesInvoiceLine.RESET;
                            SalesInvoiceLine.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                            IF SalesInvoiceLine.FINDFIRST THEN
                                REPEAT
                                    IF SalesInvoiceLine."Proof of Export" THEN
                                        SalesInvoiceLine.TESTFIELD("Proof of Export", FALSE);
                                UNTIL SalesInvoiceLine.NEXT = 0;
                        END;
                    UNTIL SalesInvoiceHeader.NEXT = 0;
                //PCPL-25

                //PCPL0017
                //TCS - Calculation Update
                //PAN
                Customer.GET(rec."Sell-to Customer No.");
                SalesLine.RESET;
                SalesLine.SETRANGE("Document No.", rec."No.");
                SalesLine.SETRANGE("Document Type", rec."Document Type");
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        IF SalesLine."No." <> '' THEN
                            IF Customer."TCS Applicable" = TRUE THEN
                                SalesLine.TESTFIELD(SalesLine."TCS Nature of Collection");
                        //PCPLTDS194Q
                        IF Customer.SEZ THEN
                            SalesLine.TESTFIELD("TCS Nature of Collection", '');
                    //PCPLTDS194Q 
                    UNTIL SalesLine.NEXT = 0;


                //TCS - Calculation Update
                //PCPL0017

                //PCPL/0017
                rec.TESTFIELD(rec."Payment Terms Code");
                //PCPL/001
            end;

        }

        addfirst("&Print")
        {
            // action("Order Confirmation")
            // {
            //     CaptionML = ENU = 'Order Confirmation',
            //                 ENN = 'Order Confirmation';
            //     Ellipsis = true;
            //     Image = Print;
            //     ApplicationArea = all;

            //     trigger OnAction();
            //     begin
            //         //DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
            //         SH.RESET;
            //         SH.SETRANGE(SH."No.", "No.");
            //         IF SH.FINDFIRST THEN
            //             REPORT.RUNMODAL(50002, TRUE, TRUE, SH);
            //     end;
            // }

            // action("<Action226>")
            // {
            //     Caption = 'Performa Invoice-Local';
            //     Image = Print;
            //     // RunObject = Report 50026; //NSW07
            // }
            // group(Printing)
            // {
            //     Caption = 'Printing';
            //     action("<Action227>")
            //     {
            //         Caption = 'Performa Invoice';
            //         Image = Print;
            //        // RunObject = Report 50026; //NSW07
            //     }
            // }
        }
    }



    var
        ApprovalMgt: Codeunit 1535;
        PurchaseHeader: Record 38;
        Text000: TextConst ENU = 'Unable to execute this function while in view only mode.', ENN = 'Unable to execute this function while in view only mode.';
        SH: Record 36;
        Customer: Record 18;
        REcCust: Record 18;
        SalesInvoiceHeader: Record 112;
        SalesInvoiceLine: Record 113;
        NoofDays: Integer;
        SalesLine: Record 37;

    procedure UpdateAllowed(): Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
            ERROR(Text000);
        EXIT(TRUE);
    end;

}

