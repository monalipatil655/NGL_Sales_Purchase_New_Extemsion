pageextension 50026 Posted_sales_inv_Ext_1 extends "Posted Sales Invoice"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,PCPL41-EINV|EWAY

    layout
    {

        addafter("Your Reference")
        {

            field("Buyer Reference No."; rec."Buyer Reference No.")
            {
                ApplicationArea = all;
            }
            field("E-Way Bill Generate"; rec."E-Way Bill Generate")
            {
                ApplicationArea = all;
            }

            field("Date Sent"; rec."Date Sent")
            {
                ApplicationArea = all;
            }

        }



    }
    actions
    {

        // addafter(Print)
        // {
        //     action("Print Tax Invoice GST")
        //     {
        //         CaptionML = ENU = 'Print Tax Invoice GST',
        //                     ENN = 'Print Invoice';
        //         Image = Print;
        //         ApplicationArea = all;

        //         trigger OnAction();
        //         begin

        //             SalesInvHeader.RESET;
        //             SalesInvHeader.SETRANGE("No.", "No.");
        //             // REPORT.RUNMODAL(REPORT::"Tax Invoice (Sales - Invoice)", TRUE, TRUE, SalesInvHeader); //NSW07


        //         end;
        //     }
        //     action("<Action251>")
        //     {
        //         Caption = 'Inter-Unit Sale(Tax Invoice)';
        //         // RunObject = Report 50053; //NSW07
        //     }

        //     action("Delivary Challan NGL-Local")
        //     {
        //         //RunObject = Report 50109;
        //     }
        // }

    }





    var
        SalesInvHeader: Record 112;
        PostedApprovalEntries: Page 659;
        IncomingDocument: Record 130;
        CRMCouplingManagement: Codeunit 5331;
        ChangeExchangeRate: Page 511;
        CustLedgerEntry: Record 21;
        EINVDet: Record 50041;
        EINVGen: Boolean;
        EINVCan: Boolean;
    // gh: DotNet DefaultPrinterNew;




}

