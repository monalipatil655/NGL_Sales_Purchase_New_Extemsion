pageextension 50066 "Warehouse Receipt Subform" extends "Whse. Receipt Subform" //OriginalId
{
    layout
    {
        addafter("Bin Code")
        {
            field(Status; rec.Status)
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
    }
}