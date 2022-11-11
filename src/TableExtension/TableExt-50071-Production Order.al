tableextension 50071 Production_order_Ext extends "Production Order"
{
    // version NAVW19.00.00.45778,PCPL/NGL/001,PCPL/QC/V3/001,PCPL/FinishedProd/INCDoc

    fields
    {


        field(50001; "Running Batch No"; Text[50])
        {
            Description = '23/05/2016 Created by sanjay';
        }
        field(50010; "Incoming Document Entry No."; Integer)
        {
            Description = 'PCPL/FinishedProd/INCDoc';
        }
        field(50011; "Incoming Document Attached"; Boolean)
        {
            Description = 'PCPL50';
        }
    }



}

