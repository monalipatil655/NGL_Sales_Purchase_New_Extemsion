tableextension 50023 Sales_header_ext extends "Sales Header"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,PCPL/NGL/003,TFS180484
    

    fields
    {


        modify("GST Customer Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted', ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted';

            //Unsupported feature: Change OptionString on ""GST Customer Type"(Field 16602)". Please convert manually.

        }
        modify("Invoice Type")
        {
            OptionCaptionML = ENU = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST', ENN = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST';

            //Unsupported feature: Change OptionString on ""Invoice Type"(Field 16605)". Please convert manually.

        }


        modify("Salesperson Code")
        {
            trigger OnAfterValidate()
            begin
                //pcpl/brb/12Jjuly19
                IF SalespersonPurchaser.GET("Salesperson Code") THEN
                    "Vendor No." := SalespersonPurchaser."Vendor No."
                ELSE
                    "Vendor No." := '';
                //pcpl/brb/12Jjuly19
            end;

        }




        field(50001; "Delivery Terms"; Text[50])
        {
            Description = 'KAR 1.0';
        }
        field(50002; "Electronic Reference No."; Text[25])
        {
            Description = 'Sanajy 16/02/2015';
        }
        field(50003; "HAWB No."; Text[200])
        {
            Caption = 'Commission Payable';
            Description = 'sanjay 05/03/2015';
        }
        field(50004; "MAWB No."; Text[30])
        {
            Description = 'Sanjay 05/03/2015';
            Enabled = false;
        }
        field(50006; "Date Received"; Date)
        {
        }
        field(50007; "Time Received"; Time)
        {
        }
        field(50008; "Date Sent"; Date)
        {
        }
        field(50009; "Time Sent"; Time)
        {
        }
        field(50021; "Vendor No."; Code[20])
        {
            Description = 'PCPl-NGL-BRB';
            TableRelation = Vendor;
        }
        field(50022; "Currency Code Vendor"; Code[10])
        {
            Description = 'PCPl-NGL-BRB';
            TableRelation = Currency;
        }
        field(50023; "Vendor Amount"; Decimal)
        {
            Description = 'PCPl-NGL-BRB';

            trigger OnValidate();
            begin
                CurrencyExchangeRate.RESET;
                CurrencyExchangeRate.SETRANGE(CurrencyExchangeRate."Currency Code", "Currency Code Vendor");
                IF CurrencyExchangeRate.FINDFIRST THEN
                    //"Vendor Amount(LCY)":= (1/CurrExchRate."Relational Exch. Rate Amount")*"Vendor Amount";
                    "Vendor Amount(LCY)" := (1 / "Currency Factor") * "Vendor Amount";
            end;
        }
        field(50024; "TDS Amount"; Decimal)
        {
            Description = 'PCPl-NGL-BRB';
        }
        field(50025; "TDS Nature of Deduction"; Code[10])
        {
            Description = 'PCPl-NGL-BRB';
            // TableRelation = "TDS Nature of Deduction"; //PCPL/NSW/MIG 11July22

            trigger OnLookup();
            begin
                //PCPL/NSW/MIG 11July22
                /*
                  SetFilterOnNODLines('','');
                  IF NODLines.FIND('-') THEN
                    REPEAT
                      TDSNOD.RESET;
                      TDSNOD.SETRANGE(Code,NODLines."NOD/NOC");
                      IF TDSNOD.FINDFIRST THEN
                        TDSNOD.MODIFYALL(Mark,TRUE);
                      COMMIT;
                    UNTIL NODLines.NEXT = 0;

                  TDSNOD.RESET;
                  TDSNOD.SETRANGE(Mark,TRUE);
                  IF PAGE.RUNMODAL(PAGE::"TDS Nature of Deductions",TDSNOD) = ACTION::LookupOK THEN
                    "TDS Nature of Deduction" := TDSNOD.Code;

                  VALIDATE("TDS Nature of Deduction");
                  */
                //PCPL/NSW/MIG 11July22
            end;

            trigger OnValidate();
            begin
                //TDSNOD.MODIFYALL(Mark,FALSE);
                //SetFilterOnNODLines("TDS Nature of Deduction",'');
            end;
        }
        field(50026; "TDS Category"; Option)
        {
            Description = 'PCPl-NGL-BRB';
            OptionMembers = " ",A,C,S,T;
        }
        field(50027; "Vendor Amount(LCY)"; Decimal)
        {
            Description = 'PCPl-NGL-BRB';
        }
        field(50028; "Commission Applicable"; Boolean)
        {
            Description = 'PCPl-NGL-BRB';
        }
        field(50033; "Sales Type"; Option)
        {
            Description = 'Setu 28-Feb-13';
            OptionMembers = "Domestic Sales","Export Sales";
        }
        field(50034; "Buyer Reference No."; Text[50])
        {
            Caption = 'Buyer Reference No.';
            Description = 'Sanjay 26/12/2014';
        }
        field(50035; "Overseas Bank Details"; Text[60])
        {
            Caption = 'Overseas Bank Details';
            Description = 'Sanjay 26/12/2014';
        }
        field(50036; Incoterms; Text[200])
        {
            Caption = 'INCOTERMS';
            Description = 'Sanjay 05/02/2015';
        }

    }
    keys
    {

    }




    var
        Text023: TextConst ENU = 'Do you want to print return receipt %1?', ENN = 'Do you want to print return receipt %1?';
        Text055: TextConst ENU = 'Do you want to print prepayment invoice %1?', ENN = 'Do you want to print prepayment invoice %1?';
        Text054: TextConst ENU = 'Do you want to print prepayment credit memo %1?', ENN = 'Do you want to print prepayment credit memo %1?';
        Text071: TextConst ENU = 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.', ENN = 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';
        recCurrency: Record 4;
        CurrExchange: Record 4;
        recUserSetup: Record 91;
        SalespersonPurchaser: Record 13;
        CurrencyExchangeRate: Record 330;
}

