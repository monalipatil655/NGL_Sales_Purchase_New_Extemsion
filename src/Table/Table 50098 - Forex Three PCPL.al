table 50098 "Forex Three PCPL"
{
    // version PCPL-BRB

    DrillDownPageID = 50065;
    LookupPageID = 50065;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Bank ref"; Text[40])
        {
        }
        field(3; "Export Invoice No."; Code[20])
        {


            trigger OnLookup();
            begin
                SalesInvoiceHeader.RESET;
                //SalesInvoiceHeader.SETRANGE("No.","Export Invoice No.");
                /*PCPL/NSW/MIG 25July22
                SalesInvoiceHeader.SETFILTER("Export Document", '%1', TRUE);
                //IF PAGE.RUNMODAL(33001126,SalesInvoiceHeader)= ACTION::OK THEN BEGIN
                IF PAGE.RUNMODAL(PAGE::"Posted Export Invoices", SalesInvoiceHeader) = ACTION::LookupOK THEN BEGIN
                    "Export Invoice No." := SalesInvoiceHeader."No.";
                    Buyer := SalesInvoiceHeader."Sell-to Customer Name";
                    "Bank ref" := SalesInvoiceHeader."Bank Ref No.";
                    "Currency Code" := SalesInvoiceHeader."Currency Code";
                    //SalesInvoiceHeader.CALCFIELDS("Amount to Customer"); //PCPL/NSW/MIG 08Jule22
                    "Invoice Value" := 0;//SalesInvoiceHeader."Amount to Customer"; //PCPL/NSW/MIG 08Jule22 Field Not exist in BC18
                    "Exc rate" := 1 / SalesInvoiceHeader."Currency Factor";//pcpl0024_25Feb2019
                END;
                */ //PCPL/NSW/MIG 25July22
            end;
        }
        field(4; Buyer; Text[50])
        {
        }
        field(5; "Currency Code"; Code[20])
        {
        }
        field(6; "Invoice Value"; Decimal)
        {
        }
        field(7; "Received Amt"; Decimal)
        {

            trigger OnValidate();
            begin
                recForexTwo.RESET;
                recForexTwo.SETRANGE(recForexTwo."Forward No.", "Forward contract");
                IF recForexTwo.FINDFIRST THEN BEGIN
                    IF recForexTwo.Amount < "Received Amt" THEN
                        ERROR('Received Amt is Greater than Amount')
                    ELSE BEGIN
                        recForexTwo."Utilized in export" := recForexTwo.Amount - "Received Amt";
                        recForexTwo.MODIFY;
                    END
                END;
                /*recForexTwo.RESET;
                recForexTwo.SETRANGE(recForexTwo."Forward No.","Forward contract");
                IF recForexTwo.FINDFIRST THEN
                  BEGIN
                        IF recForexTwo.Amount<"Received Amt" THEN
                          ERROR('Received Amt is Greater then Amount')
                        ELSE
                          BEGIN
                              IF recForexTwo."Utilized in export"=0 THEN
                                  BEGIN
                                    recForexTwo."Utilized in export":=recForexTwo.Amount-"Received Amt";
                                    recForexTwo.MODIFY;
                                  END
                              ELSE
                                  BEGIN
                                      recForexTwo."Utilized in export":=recForexTwo.Amount-recForexTwo."Utilized in export";
                                      recForexTwo."Utilized in export":=recForexTwo."Utilized in export"+"Received Amt";
                                            IF recForexTwo.Amount<recForexTwo."Utilized in export" THEN
                                              ERROR('Received Amt is Greater then Amount')
                                            ELSE
                                              recForexTwo.MODIFY;
                                  END
                          END;
                  END;*/

            end;
        }
        field(8; "Exc rate"; Decimal)
        {
        }
        field(9; "Utili. Date/Cancel Date"; Date)
        {
        }
        field(10; "Contract Status"; Option)
        {
            OptionMembers = ,Utilised,Canceled;
        }
        field(11; "Pre utilisation Rate"; Decimal)
        {
        }
        field(12; "Spot Rate on Date of Util."; Date)
        {
            Caption = 'Spot Rate on Date of Utilisation';
        }
        field(13; "Forward contract"; Text[50])
        {
            TableRelation = "Forex Two"."Forward No.";

            trigger OnValidate();
            begin
                //pcpl0024_25Feb 2019
                recForexThree.RESET;
                recForexThree.SETRANGE(recForexThree."Forward contract", "Forward contract");
                IF recForexThree.FINDLAST THEN
                    "Contract Amount" := recForexThree."Contract Amt Bal"
                ELSE BEGIN
                    recForexTwo.RESET;
                    recForexTwo.SETRANGE(recForexTwo."Forward No.", "Forward contract");
                    IF recForexTwo.FINDLAST THEN
                        "Contract Amount" := recForexTwo.Amount;
                END;
                //pcpl0024_25Feb 2019
            end;
        }
        field(14; "Contract Amount"; Decimal)
        {
        }
        field(15; Utilized; Decimal)
        {

            trigger OnValidate();
            begin
                //pcpl0024_25Feb 2019
                IF Utilized > "Contract Amount" THEN
                    ERROR('Amount Is Greater then Available Contract Amount')
                ELSE
                    "Contract Amt Bal" := "Contract Amount" - Utilized;
                recForexTwo.RESET;
                recForexTwo.SETRANGE(recForexTwo."Forward No.", "Forward contract");
                IF recForexTwo.FINDFIRST THEN BEGIN
                    recForexTwo."Remaining Amount" := "Contract Amt Bal";
                    recForexTwo.MODIFY;
                END;
                //pcpl0024_25Feb 2019
            end;
        }
        field(16; "Contract Amt Bal"; Decimal)
        {
        }
        field(17; "Document No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        SalesInvoiceHeader: Record 112;
        //PostedExportInvoices : Page 33001126; //PCPL/NSW/MIG 08Jule22
        recForexTwo: Record 50099;
        recForexThree: Record 50098;
        RecExchange: Record 86;
}

