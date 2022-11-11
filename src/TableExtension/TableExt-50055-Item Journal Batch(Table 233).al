tableextension 50055 Item_Journal_batch extends "Item Journal Batch"
{
    // version NAVW17.00,PCPL/QC/V3/001

    fields
    {


        field(50000; "Location Code"; Code[100])
        {
            Description = '//PCPL lenght is increase by 10 to 100 for multiple location in user setup';
            TableRelation = Location.Code;
        }

    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

