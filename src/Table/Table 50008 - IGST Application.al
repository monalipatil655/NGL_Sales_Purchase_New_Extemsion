table 50008 "IGST Application"
{
    // version //PCPL-25-IGSTAppl


    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(2; "Posted Invoice No."; Code[30])
        {
        }
        field(3; "Customer No."; Code[20])
        {
        }
        field(4; "Original GST Amount"; Decimal)
        {
        }
        field(5; "Remaining GST Amount"; Decimal)
        {
        }
        field(6; "Applied GST Amount"; Decimal)
        {
        }
        field(7; "Applied Document No."; Code[30])
        {
        }
        field(8; "Rounding precision"; Decimal)
        {
        }
        field(9; "Rounding G/L"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

