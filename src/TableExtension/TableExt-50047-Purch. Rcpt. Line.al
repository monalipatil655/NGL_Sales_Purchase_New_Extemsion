tableextension 50047 Purch_Rcpt_Line_Ext extends "Purch. Rcpt. Line"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484

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
        field(50156; "Packing Size"; Text[30])
        {
            Description = 'sanjay 08/12/2015';
        }
        field(50159; "QR Code"; BLOB)
        {
            Description = '//PCPL-25 Qr code';
            SubType = Bitmap;
        }

    }

    var
        recVend: Record 23;
    //NODNOCHeader : Record 13786;
    //NODNOCLines : Record 13785;
    //recTDSND : Record TDS sec;
}

