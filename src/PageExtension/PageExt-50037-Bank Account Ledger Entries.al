pageextension 50037 Bank_acc_Led_Entry extends "Bank Account Ledger Entries"
{
    // version NAVW19.00.00.46621,NAVIN9.00.00.46621\\pcpl0024_FILE GEN

    layout
    {

        addafter("Bank Account No.")
        {
            field("Transaction No."; rec."Transaction No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Statement No."; rec."Statement No.")
            {
                ApplicationArea = all;
            }
            field("Statement Status"; rec."Statement Status")
            {
                ApplicationArea = all;
            }
            field("External Document No."; rec."External Document No.")
            {
                Editable = false;
            }
        }
        addafter("Entry No.")
        {
            field("Type of payment"; rec."Type of payment")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {

        //Unsupported feature: PropertyDeletion on "Action 25". Please convert manually.



        //Unsupported feature: CodeModification on "Action 1500002.OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GLEntry.SETCURRENTKEY("Document No.","Posting Date");
        GLEntry.SETRANGE("Document No.","Document No.");
        GLEntry.SETRANGE("Posting Date","Posting Date");
        IF GLEntry.FIND('-') THEN
          REPORT.RUNMODAL(REPORT::"Posted Voucher",TRUE,TRUE,GLEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
          REPORT.RUNMODAL(REPORT::"Posted Voucher1",TRUE,TRUE,GLEntry);
        */
        //end;
        addafter("&Navigate")
        {
            // action("<Action50>")
            // {
            //     Caption = 'ChequePrinting';
            //     Image = PrintCheck;
            //     //RunObject = Report 50011; //NSW07
            //     ApplicationArea = all;
            // }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

