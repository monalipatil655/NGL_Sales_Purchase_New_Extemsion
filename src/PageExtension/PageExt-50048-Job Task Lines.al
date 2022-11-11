pageextension 50048 Job_Task_line extends "Job Task Lines"
{
    // version NAVW19.00.00.47444,PCPL-JOB0001

    layout
    {
        addafter("Amt. Rcd. Not Invoiced")
        {
            field("Remaining Cost"; rec."Remaining Cost")
            {
                ApplicationArea = all;
            }
            field("Schedule Qty"; rec."Schedule Qty")
            {
                ApplicationArea = all;
            }
            field("Usage Qty"; rec."Usage Qty")
            {
                ApplicationArea = all;
            }
            field("Remaining Qty"; rec."Remaining Qty")
            {
                ApplicationArea = all;
            }
        }
    }

    var
        JTL: Record 1001;




    trigger OnAfterGetRecord();
    Begin
        //<<PCPL-JOB0001
        JTL.RESET;
        JTL.SETRANGE("Job No.", rec."Job No.");
        JTL.SETRANGE("Job Task No.", rec."Job Task No.");
        IF JTL.FINDFIRST THEN BEGIN
            JTL.CALCFIELDS("Schedule (Total Cost)", "Usage (Total Cost)", "Schedule Qty", "Usage Qty");
            rec."Remaining Cost" := (JTL."Schedule (Total Cost)" - JTL."Usage (Total Cost)");
            rec."Remaining Qty" := (JTL."Schedule Qty" - JTL."Usage Qty");
            rec.MODIFY;
        END;
        //>>PCPL-JOB0001
    End;

    //Unsupported feature: PropertyChange. Please convert manually.

}

