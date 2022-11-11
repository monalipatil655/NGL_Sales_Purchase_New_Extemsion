tableextension 50079 Bin_Content extends "Bin Content"
{
    // version NAVW19.00.00.48466

    fields
    {


        field(50000; "Item Description"; Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            Description = 'sanjay 23-01-2015';
            FieldClass = FlowField;
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

