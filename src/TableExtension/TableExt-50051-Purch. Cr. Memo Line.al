tableextension 50051 Purch_Cr_Memo_Line_ext extends "Purch. Cr. Memo Line"
{
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



}

