page 50194 "H2H File generation"
{
    // version pcpl0024_FILE GEN

    // //pcpl0024_FILE GEN

    PageType = List;
    Permissions = TableData 271 = rm;
    SourceTable = 271;
    SourceTableView = SORTING("Entry No.")
                      ORDER(Descending)
                      WHERE(Reversed = FILTER(false),
                            Extracted = FILTER(false),
                            "Source Code" = FILTER('BANKPYMTV'),
                            "Bal. Account Type" = FILTER(Vendor),
                            "Bank Account No." = FILTER(18));

    layout
    {
        area(content)
        {
            repeater(Control001)
            {
                field("Entry No."; rec."Entry No.")
                {
                }
                field("Bank Account No."; rec."Bank Account No.")
                {
                    Editable = false;
                }
                field("Bal. Account Type"; rec."Bal. Account Type")
                {
                }
                field("Cheque No."; rec."Cheque No.")
                {
                }
                field("Posting Date"; rec."Posting Date")
                {
                }
                field("Cheque Date"; rec."Cheque Date")
                {
                }
                field("User ID"; rec."User ID")
                {
                }
                field(Amount; rec.Amount)
                {
                }
                field("Document No."; rec."Document No.")
                {
                }
                field("Currency Code"; rec."Currency Code")
                {
                }
                field(Description; rec.Description)
                {
                }
                field("Document Type"; rec."Document Type")
                {
                }
                field(Select; rec.Select)
                {
                }
                field(Extracted; rec.Extracted)
                {
                }
                field("Type of payment"; rec."Type of payment")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Button)
            {
                action("Generate File")
                {

                    trigger OnAction();
                    begin
                        GLSetup.GET();
                        IF GLSetup."File Date" <> TODAY THEN BEGIN
                            GLSetup."File Date" := TODAY;
                            GLSetup."File No." := '001';
                            GLSetup.MODIFY;
                        END;

                        DateIntD := DATE2DMY(GLSetup."File Date", 1);
                        //PCPL-25
                        IF DateIntD IN [1, 2, 3, 4, 5, 6, 7, 8, 9] THEN
                            DateIntDText := FORMAT('0' + FORMAT(DateIntD))
                        ELSE
                            DateIntDText := FORMAT(DateIntD);
                        //PCPL-25
                        DateIntM := DATE2DMY(GLSetup."File Date", 2);
                        CurrTime := FORMAT(GLSetup."File Date");
                        //FileName := PADSTR((GLSetup."Client Code"+FORMAT(DateIntD)+FORMAT(DateIntM)+'.' +GLSetup."File No."),12); //TEmp comment
                        FileName := (GLSetup."Domain ID" + '_' + GLSetup."Client Code" + '_' + GLSetup."Client Code" + FORMAT(DateIntDText) + FORMAT(DateIntM) + '.' + GLSetup."File No.");   //PCPL_25
                        FileLength := STRLEN(FORMAT(FileName));   //PCPL-25
                        MyFile.CREATE(GLSetup."Export File Path" + FileName);
                        MyFile.CREATEOUTSTREAM(MyOutStream);

                        // For Payment Instruction (H)
                        FileNameHead := (GLSetup."Client Code" + FORMAT(DateIntDText) + FORMAT(DateIntM) + '.' + GLSetup."File No.");   //PCPL_25
                        MyOutStream.WRITETEXT(PADSTR('H', 1));
                        MyOutStream.WRITETEXT(PADSTR(FileNameHead, 12));
                        MyOutStream.WRITETEXT(PADSTR(GLSetup."Client Code", 20));
                        MyOutStream.WRITETEXT();

                        // For Payment Instruction (P)
                        BankAccountLedgerEntry.RESET;
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Extracted, FALSE);
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Select, TRUE);
                        IF BankAccountLedgerEntry.FINDSET THEN
                            REPEAT
                                cnt := BankAccountLedgerEntry.COUNT;
                                TotalPayAmt += ABS(BankAccountLedgerEntry.Amount);
                            UNTIL BankAccountLedgerEntry.NEXT = 0;

                        MyOutStream.WRITETEXT(PADSTR('P', 1));
                        PayInstrDate := FORMAT(rec."Posting Date");
                        //MyOutStream.WRITETEXT(PADSTR(CONVERTSTR(FORMAT(GLSetup."File Date"),'-','/'),10));       //Payment Instruction Date
                        //PCPL-25
                        PayMonth := DATE2DMY(GLSetup."File Date", 1);
                        IF PayMonth IN [1, 2, 3, 4, 5, 6, 7, 8, 9] THEN
                            PayMonthText := FORMAT('0' + FORMAT(PayMonth))
                        ELSE
                            PayMonthText := FORMAT(PayMonth);
                        PayDate := FORMAT(PayMonthText) + '/' + FORMAT(DATE2DMY(GLSetup."File Date", 2)) + '/' + FORMAT(DATE2DMY(GLSetup."File Date", 3));
                        //PCPL-25
                        MyOutStream.WRITETEXT(PADSTR(CONVERTSTR(FORMAT(PayDate), '-', '/'), 10));       //Payment Instruction Date
                        MyOutStream.WRITETEXT(PADSTR('', 20));     //Payment Location
                        MyOutStream.WRITETEXT(PADSTR('', 1));     //Delivery mode
                        MyOutStream.WRITETEXT(PADSTR('', 5 - STRLEN(FORMAT(cnt)), '0') + FORMAT(cnt));      //Total Payment Instruction Record.
                        //MyOutStream.WRITETEXT(PADSTR('',20 - STRLEN(FORMAT(TotalPayAmt)),'0') + DELCHR(FORMAT(ABS(TotalPayAmt)),'=',','));       //Total Payment Instruction Amount
                        //PCPL-25 2nov20
                        PayTotAmt := ABS(TotalPayAmt) - ROUND(TotalPayAmt);
                        IF STRLEN(FORMAT(PayTotAmt)) = 1 THEN
                            TextTotalPay := FORMAT(PayTotAmt) + '0'
                        ELSE
                            TextTotalPay := FORMAT(PayTotAmt);
                        MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(TotalPayAmt)), '0') + DELCHR(FORMAT(ABS(TotalPayAmt)), '=', ',') + '.' + FORMAT(TextTotalPay))); //Total Payment Instruction Amount
                        //PCPL-25 2nov20
                        MyOutStream.WRITETEXT(PADSTR('', 20));      // Payment Instruction Reference
                        MyOutStream.WRITETEXT();

                        BankAccountLedgerEntry.RESET;
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Extracted, FALSE);
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Select, TRUE);
                        IF BankAccountLedgerEntry.FINDSET THEN
                            REPEAT
                                //PCPL0024_NGL START
                                MyOutStream.WRITETEXT(PADSTR('I', 1));
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::NEFT THEN
                                    MyOutStream.WRITETEXT(PADSTR('N', 1));  //Transaction TYPE-----------------------------2-2
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::RTGS THEN
                                    MyOutStream.WRITETEXT(PADSTR('R', 1)); //Transaction TYPE-----------------------------2-2
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::" " THEN//AND (BankAccountLedgerEntry."Type of payment"=BankAccountLedgerEntry."Type of payment"::RTGS) THEN
                                    MyOutStream.WRITETEXT(PADSTR('', 1)); //Transaction TYPE-----------------------------2-2
                                VendorLedgerEntry.RESET;
                                VendorLedgerEntry.SETRANGE(VendorLedgerEntry."Document No.", BankAccountLedgerEntry."Document No.");
                                IF VendorLedgerEntry.FINDFIRST THEN BEGIN
                                    vend.RESET;
                                    vend.SETRANGE(vend."No.", VendorLedgerEntry."Vendor No.");
                                    IF vend.FINDFIRST THEN BEGIN
                                        MyOutStream.WRITETEXT(PADSTR(vend."No.", 15));//Beneficiary/ Vendor code---------------------3-17...15sz
                                    END
                                    ELSE
                                        MyOutStream.WRITETEXT(PADSTR('', 15));
                                END;
                                VendorBank.RESET;
                                VendorBank.SETRANGE("Vendor No.", VendorLedgerEntry."Vendor No.");
                                IF VendorBank.FINDFIRST THEN BEGIN
                                    email := VendorBank."E-Mail";
                                    no := VendorBank."Bank Account No.";
                                    address := VendorBank.Address;
                                END;
                                MyOutStream.WRITETEXT(PADSTR(email, 45));//Mail To--------------------------------------18-62......45sz
                                MyOutStream.WRITETEXT(PADSTR(address, 160));//Bene Mailing Address-------------------------63-222.....160sz
                                MyOutStream.WRITETEXT(PADSTR(no, 85));//Bene Bank + A/c #----------------------------223-307....85sz
                                MyOutStream.WRITETEXT(PADSTR((vend.Name), 80));//Pay To---------------------------------------308-387....80sz
                                MyOutStream.WRITETEXT(PADSTR(BankAccountLedgerEntry."Cheque No.", 15));//Instrument/Cheque Number---------------------388-402.....15sz
                                MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Cheque Date", 0, '<Day,2>/<Month,2>/<Year4>'), 10));//Transaction/ cheque date---------------------403-412....10sz
                                                                                                                                                //MyOutStream.WRITETEXT(PADSTR(DELCHR(FORMAT(ABS(BankAccountLedgerEntry.Amount)),'=',','),20));//Instrument Amount----------------------------413-432....20sz
                                                                                                                                                //PCPL-25 2nov20
                                InstruAmt := ABS(BankAccountLedgerEntry.Amount);
                                AmtInst := ABS(InstruAmt) - ROUND(InstruAmt);
                                IF STRLEN(FORMAT(AmtInst)) = 1 THEN
                                    TEXTAmtInst := FORMAT(AmtInst) + '0'
                                ELSE
                                    TEXTAmtInst := FORMAT(AmtInst);
                                MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(ABS(ROUND(InstruAmt)))), '0') + DELCHR(FORMAT(ABS(InstruAmt)), '=', ',') + '.' + FORMAT(TEXTAmtInst))); // Instruction Amount
                                                                                                                                                                                             //PCPL-25 2nov20

                                MyOutStream.WRITETEXT(PADSTR('', 20));//Hundi #--------------------------------------433-452...20sz
                                IF BankAccountLedgerEntry."Currency Code" <> '' THEN
                                    MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Currency Code"), 10))//Currency Code--------------------------------453-462...10sz
                                ELSE
                                    IF GenLedgeSetup.GET THEN
                                        MyOutStream.WRITETEXT(PADSTR(FORMAT(GenLedgeSetup."LCY Code"), 10));//Currency Code--------------------------------453-462...10sz
                                MyOutStream.WRITETEXT(PADSTR('', 10));//Payment Location-----------------------------463-472....10sz //PCPL/NSW/MIG 25July22  Location code field Not Exist
                                MyOutStream.WRITETEXT(PADSTR(BankAccountLedgerEntry."Document No.", 40));//Annexure Text Link Ref (Payment Number)------473-512....40sz
                                MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + ',', 10));//Payment Date---------------------------------513-522....10sz
                                                                                                                                                       //MyOutStream.WRITETEXT(PADSTR('',5));//Number of Records in Annexure Text-----------523-527.....5sz
                                                                                                                                                       //PCPL-25
                                CLEAR(AnnCount);
                                BankLE.RESET;
                                BankLE.SETRANGE(BankLE."Document No.", BankAccountLedgerEntry."Document No.");
                                BankLE.SETRANGE(BankLE.Select, TRUE);
                                BankLE.SETRANGE(BankLE.Extracted, FALSE);
                                IF BankLE.FINDFIRST THEN
                                    REPEAT
                                        VLE.RESET;
                                        VLE.SETRANGE(VLE."Document No.", BankLE."Document No.");
                                        IF VLE.FINDFIRST THEN BEGIN
                                            AnnCount += 1;
                                        END;
                                    UNTIL BankLE.NEXT = 0;
                                MyOutStream.WRITETEXT(PADSTR('', 5 - STRLEN(FORMAT(AnnCount)), '0') + FORMAT(AnnCount));      //Nuber of records in annexture text 523..527
                                                                                                                              //PCPL-25

                                //MyOutStream.WRITETEXT(PADSTR('',5));//Number of Records in Annexure Text-----------523-527.....5sz
                                MyOutStream.WRITETEXT(PADSTR('', 10));//Print Location-------------------------------528-537....10sz
                                VendorBank.RESET;
                                VendorBank.SETRANGE("Vendor No.", VendorLedgerEntry."Vendor No.");
                                IF VendorBank.FINDFIRST THEN BEGIN
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."IFSC Code", 11));//Bene Bank IFSC code--------------------------538-548....11sz
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Savings Bank" THEN
                                        FinalACCTYPE := '010';
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Current Account" THEN
                                        FinalACCTYPE := '011';
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Cash credit Account" THEN
                                        FinalACCTYPE := '012';
                                    MyOutStream.WRITETEXT(PADSTR(FinalACCTYPE, 3));//Bene A/c type--------------------------------549-551....3sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank.Name, 70));//Bene Bank  Name------------------------------552-621....70sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."Bank Account No.", 25));//Bene Bank  A/c #-----------------------------622-646....25sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."Ben Branch Name", 40));//Bene Bank Branch-----------------------------647-686....40sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank.City, 40));//Bene Bank Location---------------------------687-726....40sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."E-Mail", 50));//Bene Mail Id---------------------------------727-776....50sz
                                END
                                ELSE BEGIN
                                    MyOutStream.WRITETEXT(PADSTR('', 11));//Bene Bank IFSC code--------------------------538-548....11sz
                                    MyOutStream.WRITETEXT(PADSTR('', 3));//Bene A/c type--------------------------------549-551....3sz
                                    MyOutStream.WRITETEXT(PADSTR('', 70));//Bene Bank  Name------------------------------552-621....70sz
                                    MyOutStream.WRITETEXT(PADSTR('', 25));//Bene Bank  A/c #-----------------------------622-646....25sz
                                    MyOutStream.WRITETEXT(PADSTR('', 40));//Bene Bank Branch-----------------------------647-686....40sz
                                    MyOutStream.WRITETEXT(PADSTR('', 40));//Bene Bank Location---------------------------687-726....40sz
                                    MyOutStream.WRITETEXT(PADSTR('', 50));//Bene Mail Id---------------------------------727-776....50sz
                                END;
                                MyOutStream.WRITETEXT();
                                //PCPL0024_NGL END
                                BankAccountLedgerEntry.Extracted := TRUE;
                                BankAccountLedgerEntry.Select := FALSE;
                                BankAccountLedgerEntry.MODIFY;
                                TotalinstrumentAmount += ABS(BankAccountLedgerEntry.Amount);    //pcpl-25 5nov20
                            UNTIL BankAccountLedgerEntry.NEXT = 0;

                        //Annexure Text  (A)
                        CLEAR(AnnxDate);
                        PostedNarration.RESET;
                        //PostedNarration.SETRANGE(PostedNarration."Entry No.","Entry No.");
                        PostedNarration.SETRANGE(PostedNarration."Transaction No.", rec."Transaction No.");
                        IF PostedNarration.FINDFIRST THEN BEGIN
                            AnnxDate := PostedNarration."Posting Date";
                            Narr := PostedNarration.Narration;
                        END;
                        MyOutStream.WRITETEXT(PADSTR('A', 1));       //Record Identifier
                        MyOutStream.WRITETEXT(PADSTR(rec."Document No.", 40));       //Annexure Text Link Ref (Payment Number)
                        //MyOutStream.WRITETEXT(PADSTR(FORMAT(AnnxDate,0,'<Day,2>/<Month,2>/<Year4>'),10));  //Payment Date
                        MyOutStream.WRITETEXT(PADSTR(FORMAT(rec."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'), 10));  //Payment Date
                        MyOutStream.WRITETEXT(PADSTR('D', 1));        //Header Detail Identifier
                        MyOutStream.WRITETEXT(PADSTR('00001', 5));        //Line Number
                        //MyOutStream.WRITETEXT(PADSTR('',170));      //Annexure Text
                        MyOutStream.WRITETEXT(PADSTR(PADSTR(Narr, 80), 170));      //Annexure Text
                        MyOutStream.WRITETEXT();

                        //Trailer Record  - Payment Instruction (T)
                        MyOutStream.WRITETEXT(PADSTR('T', 1));         //Record Identifier
                        MyOutStream.WRITETEXT(PADSTR('', 5 - STRLEN(FORMAT(cnt)), '0') + FORMAT(cnt));     //Total number of Instructions
                        MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(TotalPayAmt)), '0') + DELCHR(FORMAT(ABS(TotalPayAmt)), '=', ',') + '.' + FORMAT(TextTotalPay))); //Total Amount

                        /*//PCPL-25 5nov20
                        TotalInAmtDec := ABS(TotalinstrumentAmount)-ROUND(TotalinstrumentAmount);
                        IF STRLEN(FORMAT(TotalInAmtDec)) = 1 THEN
                          TotalInAmtTEXT := FORMAT(TotalInAmtDec) +'0'
                        ELSE
                          TotalInAmtTEXT := FORMAT(TotalInAmtDec);
                        MyOutStream.WRITETEXT((PADSTR('',17 - STRLEN(FORMAT(ABS(ROUND(TotalinstrumentAmount)))),'0') + DELCHR(FORMAT(ABS(TotalinstrumentAmount)),'=',',') +'.'+ FORMAT(TotalInAmtTEXT))); // TOTAl Amount
                        MESSAGE(FORMAT(((PADSTR('',17 - STRLEN(FORMAT(ABS(ROUND(TotalinstrumentAmount)))),'0') + DELCHR(FORMAT(ABS(TotalinstrumentAmount)),'=',',') +'.'+ FORMAT(TotalInAmtTEXT)))));
                        //PCPL-25 5nov20*/

                        MyOutStream.WRITETEXT();

                        EVALUATE(noInt, GLSetup."File No.");
                        IF noInt >= 9 THEN BEGIN
                            noInt := noInt + 1;
                            notext := '0' + FORMAT(noInt);
                            EVALUATE(GLSetup."File No.", notext);
                        END
                        ELSE BEGIN
                            noInt := noInt + 1;
                            notext := '00' + FORMAT(noInt);
                            EVALUATE(GLSetup."File No.", notext);
                        END;
                        GLSetup.MODIFY;
                        MESSAGE('File Generated!!');
                        MyFile.CLOSE;

                    end;
                }
                action("Generate File OLD")
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        GLSetup.GET();
                        IF GLSetup."File Date" <> TODAY THEN BEGIN
                            GLSetup."File Date" := TODAY;
                            GLSetup."File No." := '001';
                            GLSetup.MODIFY;
                        END;

                        DateIntD := DATE2DMY(GLSetup."File Date", 1);
                        //PCPL-25
                        IF DateIntD IN [1, 2, 3, 4, 5, 6, 7, 8, 9] THEN
                            DateIntDText := FORMAT('0' + FORMAT(DateIntD))
                        ELSE
                            DateIntDText := FORMAT(DateIntD);
                        //PCPL-25
                        DateIntM := DATE2DMY(GLSetup."File Date", 2);
                        CurrTime := FORMAT(GLSetup."File Date");
                        //FileName := PADSTR((GLSetup."Client Code"+FORMAT(DateIntD)+FORMAT(DateIntM)+'.' +GLSetup."File No."),12); //TEmp comment
                        FileName := (GLSetup."Domain ID" + '_' + GLSetup."Client Code" + '_' + GLSetup."Client Code" + FORMAT(DateIntDText) + FORMAT(DateIntM) + '.' + GLSetup."File No.");   //PCPL_25
                        FileLength := STRLEN(FORMAT(FileName));   //PCPL-25
                        MyFile.CREATE(GLSetup."Export File Path" + FileName);
                        MyFile.CREATEOUTSTREAM(MyOutStream);

                        // For Payment Instruction (H)
                        FileNameHead := (GLSetup."Client Code" + FORMAT(DateIntDText) + FORMAT(DateIntM) + '.' + GLSetup."File No.");   //PCPL_25
                        MyOutStream.WRITETEXT(PADSTR('H', 1));
                        MyOutStream.WRITETEXT(PADSTR(FileNameHead, 12));
                        MyOutStream.WRITETEXT(PADSTR(GLSetup."Client Code", 20));
                        MyOutStream.WRITETEXT();

                        // For Payment Instruction (P)
                        BankAccountLedgerEntry.RESET;
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Extracted, FALSE);
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Select, TRUE);
                        IF BankAccountLedgerEntry.FINDSET THEN
                            REPEAT
                                cnt := BankAccountLedgerEntry.COUNT;
                                TotalPayAmt += ABS(BankAccountLedgerEntry.Amount);
                            UNTIL BankAccountLedgerEntry.NEXT = 0;

                        MyOutStream.WRITETEXT(PADSTR('P', 1));
                        PayInstrDate := FORMAT(rec."Posting Date");
                        //MyOutStream.WRITETEXT(PADSTR(CONVERTSTR(FORMAT(GLSetup."File Date"),'-','/'),10));       //Payment Instruction Date
                        //PCPL-25
                        PayMonth := DATE2DMY(GLSetup."File Date", 1);
                        IF PayMonth IN [1, 2, 3, 4, 5, 6, 7, 8, 9] THEN
                            PayMonthText := FORMAT('0' + FORMAT(PayMonth))
                        ELSE
                            PayMonthText := FORMAT(PayMonth);
                        PayDate := FORMAT(PayMonthText) + '/' + FORMAT(DATE2DMY(GLSetup."File Date", 2)) + '/' + FORMAT(DATE2DMY(GLSetup."File Date", 3));
                        //PCPL-25
                        MyOutStream.WRITETEXT(PADSTR(CONVERTSTR(FORMAT(PayDate), '-', '/'), 10));       //Payment Instruction Date
                        MyOutStream.WRITETEXT(PADSTR('', 20));     //Payment Location
                        MyOutStream.WRITETEXT(PADSTR('', 1));     //Delivery mode
                        MyOutStream.WRITETEXT(PADSTR('', 5 - STRLEN(FORMAT(cnt)), '0') + FORMAT(cnt));      //Total Payment Instruction Record.
                        //MyOutStream.WRITETEXT(PADSTR('',20 - STRLEN(FORMAT(TotalPayAmt)),'0') + DELCHR(FORMAT(ABS(TotalPayAmt)),'=',','));       //Total Payment Instruction Amount
                        //PCPL-25 2nov20
                        PayTotAmt := ABS(TotalPayAmt) - ROUND(TotalPayAmt);
                        IF STRLEN(FORMAT(PayTotAmt)) = 1 THEN
                            TextTotalPay := FORMAT(PayTotAmt) + '0'
                        ELSE
                            TextTotalPay := FORMAT(PayTotAmt);
                        MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(TotalPayAmt)), '0') + DELCHR(FORMAT(ABS(TotalPayAmt)), '=', ',') + '.' + FORMAT(TextTotalPay))); //Total Payment Instruction Amount
                        //PCPL-25 2nov20
                        MyOutStream.WRITETEXT(PADSTR('', 20));      // Payment Instruction Reference
                        MyOutStream.WRITETEXT();

                        BankAccountLedgerEntry.RESET;
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Extracted, FALSE);
                        BankAccountLedgerEntry.SETRANGE(BankAccountLedgerEntry.Select, TRUE);
                        IF BankAccountLedgerEntry.FINDSET THEN
                            REPEAT
                                //PCPL0024_NGL START
                                MyOutStream.WRITETEXT(PADSTR('I', 1));
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::NEFT THEN
                                    MyOutStream.WRITETEXT(PADSTR('N', 1));  //Transaction TYPE-----------------------------2-2
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::RTGS THEN
                                    MyOutStream.WRITETEXT(PADSTR('R', 1)); //Transaction TYPE-----------------------------2-2
                                IF BankAccountLedgerEntry."Type of payment" = BankAccountLedgerEntry."Type of payment"::" " THEN//AND (BankAccountLedgerEntry."Type of payment"=BankAccountLedgerEntry."Type of payment"::RTGS) THEN
                                    MyOutStream.WRITETEXT(PADSTR('', 1)); //Transaction TYPE-----------------------------2-2
                                VendorLedgerEntry.RESET;
                                VendorLedgerEntry.SETRANGE(VendorLedgerEntry."Document No.", BankAccountLedgerEntry."Document No.");
                                IF VendorLedgerEntry.FINDFIRST THEN BEGIN
                                    vend.RESET;
                                    vend.SETRANGE(vend."No.", VendorLedgerEntry."Vendor No.");
                                    IF vend.FINDFIRST THEN BEGIN
                                        MyOutStream.WRITETEXT(PADSTR(vend."No.", 15));//Beneficiary/ Vendor code---------------------3-17...15sz
                                    END
                                    ELSE
                                        MyOutStream.WRITETEXT(PADSTR('', 15));
                                END;
                                VendorBank.RESET;
                                VendorBank.SETRANGE("Vendor No.", VendorLedgerEntry."Vendor No.");
                                IF VendorBank.FINDFIRST THEN BEGIN
                                    email := VendorBank."E-Mail";
                                    no := VendorBank."Bank Account No.";
                                    address := VendorBank.Address;
                                END;
                                MyOutStream.WRITETEXT(PADSTR(email, 45));//Mail To--------------------------------------18-62......45sz
                                MyOutStream.WRITETEXT(PADSTR(address, 160));//Bene Mailing Address-------------------------63-222.....160sz
                                MyOutStream.WRITETEXT(PADSTR(no, 85));//Bene Bank + A/c #----------------------------223-307....85sz
                                MyOutStream.WRITETEXT(PADSTR((vend.Name), 80));//Pay To---------------------------------------308-387....80sz
                                MyOutStream.WRITETEXT(PADSTR(BankAccountLedgerEntry."Cheque No.", 15));//Instrument/Cheque Number---------------------388-402.....15sz
                                MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Cheque Date", 0, '<Day,2>/<Month,2>/<Year4>'), 10));//Transaction/ cheque date---------------------403-412....10sz
                                                                                                                                                //MyOutStream.WRITETEXT(PADSTR(DELCHR(FORMAT(ABS(BankAccountLedgerEntry.Amount)),'=',','),20));//Instrument Amount----------------------------413-432....20sz
                                                                                                                                                //PCPL-25 2nov20
                                InstruAmt := ABS(BankAccountLedgerEntry.Amount);
                                AmtInst := ABS(InstruAmt) - ROUND(InstruAmt);
                                IF STRLEN(FORMAT(AmtInst)) = 1 THEN
                                    TEXTAmtInst := FORMAT(AmtInst) + '0'
                                ELSE
                                    TEXTAmtInst := FORMAT(AmtInst);
                                MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(ABS(ROUND(InstruAmt)))), '0') + DELCHR(FORMAT(ABS(InstruAmt)), '=', ',') + '.' + FORMAT(TEXTAmtInst))); // Instruction Amount
                                                                                                                                                                                             //PCPL-25 2nov20

                                MyOutStream.WRITETEXT(PADSTR('', 20));//Hundi #--------------------------------------433-452...20sz
                                IF BankAccountLedgerEntry."Currency Code" <> '' THEN
                                    MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Currency Code"), 10))//Currency Code--------------------------------453-462...10sz
                                ELSE
                                    IF GenLedgeSetup.GET THEN
                                        MyOutStream.WRITETEXT(PADSTR(FORMAT(GenLedgeSetup."LCY Code"), 10));//Currency Code--------------------------------453-462...10sz
                                MyOutStream.WRITETEXT(PADSTR('', 10));//Payment Location-----------------------------463-472....10sz  //PCPL/NSW/MIG 25July22  Location code field Not Exist
                                MyOutStream.WRITETEXT(PADSTR('', 40));//Annexure Text Link Ref (Payment Number)------473-512....40sz
                                MyOutStream.WRITETEXT(PADSTR(FORMAT(BankAccountLedgerEntry."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + ',', 10));//Payment Date---------------------------------513-522....10sz
                                MyOutStream.WRITETEXT(PADSTR('', 5));//Number of Records in Annexure Text-----------523-527.....5sz
                                MyOutStream.WRITETEXT(PADSTR('', 10));//Print Location-------------------------------528-537....10sz
                                VendorBank.RESET;
                                VendorBank.SETRANGE("Vendor No.", VendorLedgerEntry."Vendor No.");
                                IF VendorBank.FINDFIRST THEN BEGIN
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."IFSC Code", 11));//Bene Bank IFSC code--------------------------538-548....11sz
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Savings Bank" THEN
                                        FinalACCTYPE := '010';
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Current Account" THEN
                                        FinalACCTYPE := '011';
                                    IF VendorBank."Ben Acc Type" = VendorBank."Ben Acc Type"::"Cash credit Account" THEN
                                        FinalACCTYPE := '012';
                                    MyOutStream.WRITETEXT(PADSTR(FinalACCTYPE, 3));//Bene A/c type--------------------------------549-551....3sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank.Name, 70));//Bene Bank  Name------------------------------552-621....70sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."Bank Account No.", 25));//Bene Bank  A/c #-----------------------------622-646....25sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."Ben Branch Name", 40));//Bene Bank Branch-----------------------------647-686....40sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank.City, 40));//Bene Bank Location---------------------------687-726....40sz
                                    MyOutStream.WRITETEXT(PADSTR(VendorBank."E-Mail", 50));//Bene Mail Id---------------------------------727-776....50sz
                                END
                                ELSE BEGIN
                                    MyOutStream.WRITETEXT(PADSTR('', 11));//Bene Bank IFSC code--------------------------538-548....11sz
                                    MyOutStream.WRITETEXT(PADSTR('', 3));//Bene A/c type--------------------------------549-551....3sz
                                    MyOutStream.WRITETEXT(PADSTR('', 70));//Bene Bank  Name------------------------------552-621....70sz
                                    MyOutStream.WRITETEXT(PADSTR('', 25));//Bene Bank  A/c #-----------------------------622-646....25sz
                                    MyOutStream.WRITETEXT(PADSTR('', 40));//Bene Bank Branch-----------------------------647-686....40sz
                                    MyOutStream.WRITETEXT(PADSTR('', 40));//Bene Bank Location---------------------------687-726....40sz
                                    MyOutStream.WRITETEXT(PADSTR('', 50));//Bene Mail Id---------------------------------727-776....50sz
                                END;
                                MyOutStream.WRITETEXT();
                                //PCPL0024_NGL END
                                // BankAccountLedgerEntry.Extracted:=TRUE;   //temp comment
                                //BankAccountLedgerEntry.Select  :=FALSE;    //temp comment
                                BankAccountLedgerEntry.MODIFY;
                                TotalinstrumentAmount += ABS(BankAccountLedgerEntry.Amount);    //pcpl-25 5nov20

                            UNTIL BankAccountLedgerEntry.NEXT = 0;

                        //Annexure Text  (A)
                        CLEAR(AnnxDate);
                        PostedNarration.RESET;
                        PostedNarration.SETRANGE(PostedNarration."Entry No.", rec."Entry No.");
                        PostedNarration.SETRANGE(PostedNarration."Transaction No.", rec."Transaction No.");
                        IF PostedNarration.FINDFIRST THEN BEGIN
                            AnnxDate := PostedNarration."Posting Date";
                            Narr := PostedNarration.Narration;
                        END;
                        MyOutStream.WRITETEXT(PADSTR('A', 1));       //Record Identifier
                        MyOutStream.WRITETEXT(PADSTR(rec."Document No.", 40));       //Annexure Text Link Ref (Payment Number)
                        //MyOutStream.WRITETEXT(PADSTR(FORMAT(AnnxDate,0,'<Day,2>/<Month,2>/<Year4>'),10));  //Payment Date
                        MyOutStream.WRITETEXT(PADSTR(FORMAT(rec."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'), 10));  //Payment Date
                        MyOutStream.WRITETEXT(PADSTR('H', 1));        //Header Detail Identifier
                        MyOutStream.WRITETEXT(PADSTR('', 5));        //Line Number
                        //MyOutStream.WRITETEXT(PADSTR('',170));      //Annexure Text
                        MyOutStream.WRITETEXT(PADSTR(PADSTR(Narr, 80), 170));      //Annexure Text
                        MyOutStream.WRITETEXT();

                        //Trailer Record  - Payment Instruction (T)
                        MyOutStream.WRITETEXT(PADSTR('T', 1));         //Record Identifier
                        MyOutStream.WRITETEXT(PADSTR('', 5 - STRLEN(FORMAT(cnt)), '0') + FORMAT(cnt));     //Total number of Instructions
                        MyOutStream.WRITETEXT((PADSTR('', 17 - STRLEN(FORMAT(TotalPayAmt)), '0') + DELCHR(FORMAT(ABS(TotalPayAmt)), '=', ',') + '.' + FORMAT(TextTotalPay))); //Total Amount

                        /*//PCPL-25 5nov20
                        TotalInAmtDec := ABS(TotalinstrumentAmount)-ROUND(TotalinstrumentAmount);
                        IF STRLEN(FORMAT(TotalInAmtDec)) = 1 THEN
                          TotalInAmtTEXT := FORMAT(TotalInAmtDec) +'0'
                        ELSE
                          TotalInAmtTEXT := FORMAT(TotalInAmtDec);
                        MyOutStream.WRITETEXT((PADSTR('',17 - STRLEN(FORMAT(ABS(ROUND(TotalinstrumentAmount)))),'0') + DELCHR(FORMAT(ABS(TotalinstrumentAmount)),'=',',') +'.'+ FORMAT(TotalInAmtTEXT))); // TOTAl Amount
                        MESSAGE(FORMAT(((PADSTR('',17 - STRLEN(FORMAT(ABS(ROUND(TotalinstrumentAmount)))),'0') + DELCHR(FORMAT(ABS(TotalinstrumentAmount)),'=',',') +'.'+ FORMAT(TotalInAmtTEXT)))));
                        //PCPL-25 5nov20*/

                        MyOutStream.WRITETEXT();

                        EVALUATE(noInt, GLSetup."File No.");
                        IF noInt >= 9 THEN BEGIN
                            noInt := noInt + 1;
                            notext := '0' + FORMAT(noInt);
                            EVALUATE(GLSetup."File No.", notext);
                        END
                        ELSE BEGIN
                            noInt := noInt + 1;
                            notext := '00' + FORMAT(noInt);
                            EVALUATE(GLSetup."File No.", notext);
                        END;
                        GLSetup.MODIFY;
                        MESSAGE('File Generated!!');
                        MyFile.CLOSE;

                    end;
                }
            }
        }
    }

    var
        PostingDate: Date;
        BankAccountRec: Record 270;
        FilterValue: Text[100];
        FilterValue1: Text[100];
        UserSetup: Record 91;
        vend: Record 23;
        MyFile: File;
        MyOutStream: OutStream;
        CreateText: Text;
        CompanyInformation: Record 79;
        BankAccountLedgerEntry1: Record 271;
        TotalAmt: Decimal;
        CountRecords: Integer;
        NoSeriesManagement: Codeunit 396;
        FileName: Text;
        BatchFileName: Text;
        PostingDate1: Date;
        GLSetup: Record 98;
        datestring1: Text[20];
        datestring2: Text[20];
        intResultInInteger: Text[20];
        intResultInInteger1: Text[20];
        Pos: Integer;
        PayLinkExist: Boolean;
        VendorBank: Record 288;
        VendorLedgerEntry: Record 25;
        BankAccount: Record 270;
        VendorLedgerEntry1: Record 25;
        SrNo: Integer;
        Totamtpay: Decimal;
        Amt: Decimal;
        GenLedgeSetup: Record 98;
        DetailVendLedger: Record 380;
        CurrTime: Text;
        Date: Text;
        DetailedVendLedgr: Record 380;
        VendLedgr: Record 25;
        VarBeneLength: Integer;
        tempbene: Text[15];
        FinalACCTYPE: Code[33];
        BankAccountLedgerEntry: Record 271;
        noInt: Integer;
        notext: Code[20];
        recBankAccount: Record 270;
        email: Text[80];
        name: Text[50];
        no: Text[30];
        address: Text[80];
        DateIntM: Integer;
        DateIntD: Integer;
        PayInstrDate: Text;
        TotalPayAmt: Decimal;
        TextTotalPayAmt: Text;
        cnt: Integer;
        textcnt: Text;
        PostedNarration: Record "Posted Narration";
        AnnxDate: Date;
        FileLength: Integer;
        FileNameHead: Text;
        PayDate: Text;
        DateIntDText: Text;
        PayMonth: Integer;
        PayMonthText: Text;
        PayTotAmt: Decimal;
        TextTotalPay: Text;
        InstruAmt: Decimal;
        InstruAmtText: Text;
        TotalinstrumentAmount: Decimal;
        TotalInAmtDec: Decimal;
        TotalInAmtTEXT: Text;
        AmtInst: Decimal;
        TEXTAmtInst: Text;
        BankLE: Record 271;
        AnnCount: Integer;
        VLE: Record 25;
        Narr: Text;
}

