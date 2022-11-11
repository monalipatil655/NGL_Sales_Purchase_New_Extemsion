tableextension 50049 Purch_Inv_Line_Ext extends "Purch. Inv. Line"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484,//PCPLTDS194Q

    fields
    {


        field(50002; "Prepayment Invoice No."; Code[20])
        {
        }
        field(50003; "Prepayment TDS Amount"; Decimal)
        {
        }
        field(50006; "Actual Qty Received"; Decimal)
        {
            Description = 'Sh 24.05.11';
        }
        field(50007; "Type of Packing"; Text[20])
        {
            Description = 'Sh 24.05.11';
        }
        field(50008; "Actual Receipt Date"; Date)
        {
            Description = 'AMK';
        }
        field(50018; "PO Quantity"; Decimal)
        {

            trigger OnValidate();
            begin


                TESTFIELD(Quantity);
                /*
                
                QtyVal := Quantity*(6/100);
                qty:="PO Quantity"+QtyVal;
                IF "PO Quantity" > qty THEN
                
                ERROR('');
                 */

            end;
        }
        field(50020; "Description 3"; Text[30])
        {
            Description = 'INDENT';
        }
        field(50021; "Material Requisition"; Text[50])
        {
            Description = 'INDENT';
        }
        field(50022; "FA Component Category"; Code[20])
        {
            Description = 'INDENT';
            TableRelation = test3.test;
        }
        field(50023; "Indent No."; Code[20])
        {
            Description = 'RSPL-Indent';
        }
        field(50024; "Indent Line No."; Integer)
        {
            Description = 'RSPL-Indent';
        }

    }

    //Unsupported feature: PropertyDeletion. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

