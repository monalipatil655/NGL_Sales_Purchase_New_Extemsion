pageextension 50025 User_setup extends "User Setup"
{
    // version NAVW17.00,PCPL-25/proofExp

    layout
    {

        addafter("Register Time")
        {
            field("E-Mail"; rec."E-Mail")
            {
                ApplicationArea = all;
            }

            field("Location Code"; rec."Location Code")
            {
                ApplicationArea = all;

            }
            field("Sales Amount Approval Limit"; rec."Sales Amount Approval Limit")
            {
                ApplicationArea = all;
            }
            field("Purchase Amount Approval Limit"; rec."Purchase Amount Approval Limit")
            {
                ApplicationArea = all;
            }
            field("Unlimited Sales Approval"; rec."Unlimited Sales Approval")
            {
                ApplicationArea = all;
            }
            field("Unlimited Purchase Approval"; rec."Unlimited Purchase Approval")
            {
                ApplicationArea = all;
            }
            field("Maintenance job.approval ID"; rec."Maintenance job.approval ID")
            {
                ApplicationArea = all;
            }
            field("Proof of Export"; rec."Proof of Export")
            {
                ApplicationArea = all;
            }
            field("Bin Code"; rec."Bin Code")
            {
                ApplicationArea = all;
            }
            field("Chart of Account Access"; rec."Chart of Account Access")
            {
                ApplicationArea = all;
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

