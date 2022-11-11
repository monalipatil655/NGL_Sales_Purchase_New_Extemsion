table 50068 "Payment Terms PortalUse"
{
    // version //pcpl002430oct2018


    fields
    {
        field(1;"Code";Code[30])
        {
            Description = 'pcpl0024/26oct2018';
            NotBlank = true;
        }
        field(2;Descripion;Text[150])
        {
            Description = 'pcpl0024/26oct2018';
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}

