pageextension 50626 Bank_Payment_Voucher extends "Bank Payment Voucher"
{
    // version NAVIN7.10\\pcpl0024_FILE GEN

    layout
    {




    }
    actions
    {


        modify(Approvals)
        {
            Visible = false;
        }
        modify(Preview)
        {
            Visible = false;
        }

        modify(SendApprovalRequest)
        {
            Visible = false;
        }
        modify(SendApprovalRequestJournalBatch)
        {
            Visible = false;
        }
        modify(SendApprovalRequestJournalLine)
        {
            Visible = false;
        }
        modify(CancelApprovalRequest)
        {
            Visible = false;
        }
        modify(CancelApprovalRequestJournalBatch)
        {
            Visible = false;
        }
        modify(CancelApprovalRequestJournalLine)
        {
            Visible = false;
        }

        modify(Approve)
        {
            Visible = false;
        }
        modify(Reject)
        {
            Visible = false;
        }
        modify(Delegate)
        {
            Visible = false;
        }

        // addafter("Print Check")
        // {
        //     action("Purchase Order- FA")
        //     {
        //         Caption = 'PO-FA';
        //         Image = "Report";
        //         Promoted = true;
        //         PromotedCategory = Process;
        //         // RunObject = Report 50041; //NSW07
        //         ApplicationArea = all;
        //     }
        //     action("Purchase Order- RMPM")
        //     {
        //         Caption = 'PO-RMPM';
        //         Image = "Report";
        //         Promoted = true;
        //         PromotedCategory = Process;
        //         // RunObject = Report 50035; //NSW07
        //         ApplicationArea = all;
        //     }
        // }


    }


    var
        GenJournalLine: Record 81;
        recVendor: Record 23;



}

