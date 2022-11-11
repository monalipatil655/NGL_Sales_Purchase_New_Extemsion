tableextension 50067 Job_Task extends "Job Task"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,PCPL-JOB0001

    fields
    {

        modify("Usage (Total Cost)")
        {
            trigger OnAfterValidate()
            begin
                //<<PCPL/NSW/120422
                IF ("Schedule (Total Cost)" <> 0) THEN
                    "Remaining Cost" := ("Schedule (Total Cost)" - "Usage (Total Cost)");
                //>>PCPL/NSW/120422
            end;
        }
        field(50000; "Remaining Cost"; Decimal)
        {
            Description = 'PCPL-JOB0001';
            Editable = false;
        }
        field(50001; "Schedule Qty"; Decimal)
        {
            CalcFormula = Sum("Job Planning Line".Quantity WHERE("Job No." = FIELD("Job No."),
                                                                  "Job Task No." = FIELD("Job Task No."),
                                                                  "Job Task No." = FIELD(FILTER(Totaling)),
                                                                  "Schedule Line" = CONST(true),
                                                                  "Planning Date" = FIELD("Planning Date Filter")));
            Description = 'PCPL-JOB0001';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Usage Qty"; Decimal)
        {
            CalcFormula = Sum("Job Ledger Entry".Quantity WHERE("Job No." = FIELD("Job No."),
                                                                  "Job Task No." = FIELD("Job Task No."),
                                                                  "Job Task No." = FIELD(FILTER(Totaling)),
                                                                 "Entry Type" = CONST(Usage),
                                                                 "Posting Date" = FIELD("Posting Date Filter")));
            Description = 'PCPL-JOB0001';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Remaining Qty"; Decimal)
        {
            Description = 'PCPL-JOB0001';
            Editable = false;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

