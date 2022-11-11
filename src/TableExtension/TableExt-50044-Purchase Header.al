tableextension 50044 Purchase_Header extends "Purchase Header"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,PCPL/NGL/001,TFS180484,PCPL/QC/V3/001

    fields
    {
        modify("GST Vendor Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted', ENN = ' ,Registered,Composite,Unregistered,Import,Exempted';

            //Unsupported feature: Change OptionString on ""GST Vendor Type"(Field 16609)". Please convert manually.

        }
        modify("GST Input Service Distribution")
        {
            CaptionML = ENU = 'GST Input Service Distribution';
        }


        modify("Pay-to Vendor No.")
        {
            trigger OnAfterValidate()
            var
                Vend: Record 23;
            begin
                IF Vend.Get("Pay-to Vendor No.") then  //PCPL/NSW/MIG 11July22  New var Define and Get the Vend,Below code is NGL customization
                    VALIDATE("Qty Discount Type", Vend."Qty Discount Type");

            end;
        }
        modify("Expected Receipt Date")
        {
            trigger OnAfterValidate()
            begin
                //**IRL3.03**QC- Points**001**260312**SP
                IF "Expected Receipt Date" < "Order Date" THEN
                    ERROR('This date can not be less than Order Date');
                //**IRL3.03**QC- Points**001**260312**SP
            end;
        }






        //Unsupported feature: CodeModification on ""Requested Receipt Date"(Field 5790).OnValidate". Please convert manually.
        modify("Requested Receipt Date")
        {
            trigger OnBeforeValidate()
            begin
                //**IRL3.03**QC- Points**001**260312**SP
                IF "Requested Receipt Date" < "Order Date" THEN
                    ERROR('This date can not be less than Order Date');
                //**IRL3.03**QC- Points**001**260312**SP
            end;
        }



        field(50000; Freight; Option)
        {
            Description = 'KAR1.0';
            OptionMembers = " ","To Pay","Paid basis","to be included in Tax Invoice";
        }
        field(50001; "Port of Loading"; Text[30])
        {
        }
        field(50002; "Place of Discharge"; Text[50])
        {
        }
        field(50003; Warranty; Text[30])
        {
        }
        field(50005; "Qty Discount Type"; Option)
        {
            Description = 'Sh 24.05.11';
            OptionCaption = 'Per KG,Percentage';
            OptionMembers = "Per KG",Percentage;
        }
        field(50006; "Delivery Schedule"; Text[80])
        {
            Caption = 'Sales Contract No. & Date';
            Description = 'mayuri';
        }
        field(50008; "Payment terms"; Text[50])
        {
            Description = 'FOR IMPORT PO';
        }
        field(50010; "Shiping Agent Code"; Code[20])
        {
            TableRelation = "Shipping Agent";
        }
        field(50011; "Bank Account"; Code[20])
        {
            Description = 'GITLExim';
            TableRelation = "Bank Account"."No.";
        }

        field(50016; "Closed PO"; Boolean)
        {
            Description = '//PCPL 38';
        }
        field(50028; Insurance; Option)
        {
            Description = 'Gunjan';
            OptionCaption = 'NGL Insurance Policy,Vendor Insurance Policy';
            OptionMembers = "NGL Insurance Policy","Vendor Insurance Policy";
        }
        field(50029; "Quotation No"; Text[30])
        {
            Description = 'sanjay';
        }
        field(50030; "Total Import Charges"; Decimal)
        {
        }
        field(50050; "Vendor Invoice Date"; Date)
        {
        }
        field(50300; "Quoation Date"; Date)
        {
            Description = 'Karya';
        }
        field(50302; "Item Description"; Text[100])
        {
            CalcFormula = Lookup("Purchase Line".Description WHERE("Document No." = FIELD("No.")));
            Description = 'Sanjay 19/11/2014';
            FieldClass = FlowField;
        }
        field(50303; "Item Code"; Text[30])
        {
            CalcFormula = Lookup("Purchase Line"."No." WHERE("Document No." = FIELD("No.")));
            Description = 'Sanjay 19/11/2014';
            FieldClass = FlowField;
        }
        field(50304; PackingDetails; Text[249])
        {
            Description = 'sanjay add for packing details 29/07/2016';
        }
        field(50305; "Rjected Remarks"; Text[150])
        {
            Description = 'PCPL0024';
        }
        field(50306; "Loading/Unloading Charges"; Text[30])
        {
            Description = 'PCPL0050';
        }

        field(99008500; "Date Received"; Date)
        {
            Caption = 'Date Received';
        }
        field(99008501; "Time Received"; Time)
        {
            Caption = 'Time Received';
        }
        field(99008509; "Date Sent"; Date)
        {
            Caption = 'Date Sent';
            Enabled = false;
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }

    }
    trigger OnInsert()
    Begin
        "Assigned User ID" := USERID;//PCPL/NSW/07 14June22
    End;



    var
        Text024: TextConst ENU = 'Do you want to print return shipment %1?', ENN = 'Do you want to print return shipment %1?';

    var
        ArchiveManagement: Codeunit 5063;
        ReservePurchLine: Codeunit 99000834;

    var
        Text043: TextConst ENU = 'Do you want to print prepayment invoice %1?', ENN = 'Do you want to print prepayment invoice %1?';
        Text044: TextConst ENU = 'Do you want to print prepayment credit memo %1?', ENN = 'Do you want to print prepayment credit memo %1?';

    var
        Text047: TextConst ENU = 'Deleting this document will cause a gap in the number series for prepayment credit memos. ', ENN = 'Deleting this document will cause a gap in the number series for prepayment credit memos. ';

    var
        Text053: TextConst ENU = 'There are unposted prepayment amounts on the document of type %1 with the number %2.', ENN = 'There are unposted prepayment amounts on the document of type %1 with the number %2.';

    var
        VendorISDErr: TextConst Comment = '%1 = Location Code, %2 = GST Vendor Type, %3 = GST Vendor Type, %4 = GST Vendor Type', ENU = 'You cannot select Input Service Distribution Location %1 for Vendor Types %2, %3, %4.', ENN = 'You cannot select Input Service Distribution Location %1 for Vendor Types %2, %3, %4.';
        recUserSetup: Record "User Setup";

        // recEximSetup: Record 33000990; //PCPL/NSW/MIG  11July22
        //cduEximPurchMgmt: Codeunit 33000998; //PCPL/NSW/MIG  11July22
        PurchSubpage: Page 54;

        Recpurchaserheader: Record 38;
        RecVendor: Record 23;
        VarEmailSender: Text[150];
        VarRecipaint: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        //SMTP: Codeunit 400;
        sr: Integer;
        recpurchashline: Record 39;
        pdfname: Text[150];
        recitem: Record 27;
        recspecificationheader: Record 50015;
        // Purchase_OrderNGL_T1: Report 50023; //NSW07
        PurchaseHeader: Record 38;
        recVend: Record 23;
        //Purchase_OrderNGL_T: Report 50035; //NSW07
        //Purchase_OrderFA_T: Report 50036; //NSW07
        RUser: Record 91;

    procedure UpdateIndent()
    var
        IndentPO: Record 50005;
        POLine: Record 39;
    begin
        IndentPO.RESET;
        IndentPO.SETRANGE(IndentPO."P.O.No.", "No.");
        IF IndentPO.FIND('-') THEN
            IndentPO.DELETEALL;
        POLine.SETRANGE(POLine."Document No.", "No.");
        IF POLine.FINDFIRST THEN BEGIN
            REPEAT
                IF POLine."Indent No." <> '' THEN BEGIN
                    IndentPO.INIT;
                    IndentPO.VALIDATE(IndentPO."Document No.", POLine."Indent No.");
                    IndentPO.VALIDATE(IndentPO."Line No.", POLine."Indent Line No.");
                    IndentPO.VALIDATE(IndentPO.Type, POLine.Type);
                    IndentPO.VALIDATE(IndentPO."No.", POLine."No.");
                    IndentPO.VALIDATE(IndentPO."PO Line No.", POLine."Line No.");
                    IndentPO.VALIDATE(IndentPO."Location Code", POLine."Location Code");
                    IndentPO.VALIDATE(IndentPO."P.O.Qty", POLine.Quantity);
                    IF "Document Type" = "Document Type"::Order THEN
                        IndentPO.VALIDATE(IndentPO."P.O.No.", POLine."Document No.");
                    IndentPO.VALIDATE(IndentPO."P.O.Date", POLine."Posting Date");
                    IndentPO.INSERT(TRUE);
                    IndentPO.VALIDATE(IndentPO."P.O.Qty");  //ROBOSOFT-V001
                END;
            UNTIL POLine.NEXT = 0;
        END;
    end;

    procedure UpdateReq()
    var
        PurchLine: Record 39;
        IndentPO: Record 50005;
        ReqLine: Record 246;
    begin
        IndentPO.RESET;
        IndentPO.SETRANGE(IndentPO."P.O.No.", "No.");
        IF IndentPO.FINDSET THEN BEGIN
            REPEAT
                PurchLine.SETRANGE(PurchLine."Document No.", "No.");
                IF PurchLine.FINDFIRST THEN BEGIN
                    PurchLine.SETRANGE(PurchLine."Indent No.", IndentPO."Document No.");
                    PurchLine.SETRANGE(PurchLine.Type, IndentPO.Type);
                    PurchLine.SETRANGE(PurchLine."No.", IndentPO."No.");
                    PurchLine.SETRANGE(PurchLine."Line No.", IndentPO."PO Line No.");
                    IF PurchLine.FINDFIRST THEN
                        IF PurchLine."Indent No." <> '' THEN BEGIN
                            ReqLine.RESET;
                            ReqLine.SETRANGE(ReqLine."Entry no", IndentPO."Document No.");
                            //        ReqLine.SETRANGE(ReqLine."Indent Line No",IndentPO."PO Line No.");
                            ReqLine.SETRANGE(ReqLine.Type, IndentPO.Type);
                            ReqLine.SETRANGE(ReqLine."No.", IndentPO."No.");
                            ReqLine.SETRANGE(ReqLine."Location Code", IndentPO."Location Code");
                            IF ReqLine.FINDSET THEN BEGIN
                                REPEAT
                                    IF ReqLine.Quantity > 0 THEN BEGIN
                                        // REPEAT
                                        IF IndentPO."P.O.Qty" > ReqLine.Quantity THEN BEGIN
                                            IndentPO."P.O.Qty" -= ReqLine.Quantity;
                                            ReqLine.Quantity := 0;
                                        END ELSE BEGIN
                                            ReqLine.Quantity -= IndentPO."P.O.Qty";
                                            IndentPO."P.O.Qty" := 0;
                                        END;

                                        //UNTIL ReqLine.NEXT=0;
                                    END;
                                    //ELSE
                                    // ReqLine.NEXT;
                                    //         MESSAGE('%1,%2',ReqLine.Quantity,IndentPO."P.O.Qty");
                                    ReqLine.MODIFY;
                                    //Abhinav-31.03.12---Start
                                    IF ReqLine.Quantity = 0 THEN BEGIN
                                        ReqLine.DELETE;
                                        //      IndentPO.DELETE;
                                    END;
                                //Abhinav-31.03.12---Start
                                UNTIL ReqLine.NEXT = 0;
                            END;
                        END;

                END;
            UNTIL IndentPO.NEXT = 0;
        END;

    end;

    // procedure sendmailtovendor(docno: Code[60])
    // var
    //     RUser: Record 91;
    // begin
    //     Recpurchaserheader.RESET;
    //     Recpurchaserheader.SETRANGE(Recpurchaserheader."No.", docno);
    //     //  Recpurchaserheader.SETRANGE(Recpurchaserheader."Import Document", FALSE); //PCPL/NSW/MIG  01Aug22
    //     //PurchaseHeader.SETRANGE(PurchaseHeader."Import Document",FALSE);//4jan
    //     //Recpurchaserheader.SETRANGE(Recpurchaserheader.Status,Recpurchaserheader.Status::Released);//10dec2018
    //     IF Recpurchaserheader.FINDFIRST THEN BEGIN
    //         RecVendor.RESET();
    //         RecVendor.SETRANGE(RecVendor."No.", Recpurchaserheader."Buy-from Vendor No.");
    //         IF RecVendor.FINDFIRST THEN BEGIN
    //             IF RecVendor."E-Mail" <> '' THEN
    //                 // VarRecipaint := RecVendor."E-Mail";//1  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                 VarRecipaint.Add(RecVendor."E-Mail");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF RecVendor."E-Mail1" <> '' THEN
    //                 //VarRecipaint := RecVendor."E-Mail1";//2 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                  VarRecipaint.Add(RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF RecVendor."E-Mail2" <> '' THEN
    //                 //VarRecipaint := RecVendor."E-Mail2";//3 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                  VarRecipaint.Add(RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail1" <> '') THEN
    //                 //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail1";//1&2 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                 VarRecipaint.Add(RecVendor."E-Mail" + ';' + RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail2" <> '') THEN
    //                 //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail2";  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                 VarRecipaint.Add(RecVendor."E-Mail" + ';' + RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF (RecVendor."E-Mail1" <> '') AND (RecVendor."E-Mail2" <> '') THEN
    //                 //VarRecipaint := RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2";//2&3  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                 VarRecipaint.Add(RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

    //             IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail1" <> '') AND (RecVendor."E-Mail2" <> '') THEN
    //                 //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2";//123 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //                 VarRecipaint.Add(RecVendor."E-Mail1" + ';' + RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 
    //         END;
    //         //END;

    //         IF (Recpurchaserheader.Status = Recpurchaserheader.Status::Released) OR (Recpurchaserheader.Status = Recpurchaserheader.Status::"Pending Approval") THEN//pcpl0024_10dec2018
    //         BEGIN //pcpl0024_10dec2018
    //             //IF VarRecipaint <> '' THEN BEGIN  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
    //             IF Not VarRecipaint.Contains('') then begin //PCPL/NSW/MIG 11July22 New Code add 
    //                 Recpurchaserheader.RESET;
    //                 Recpurchaserheader.SETRANGE(Recpurchaserheader."No.", docno);
    //                 IF Recpurchaserheader.FINDFIRST THEN BEGIN
    //                     RecVendor.RESET();
    //                     RecVendor.SETRANGE(RecVendor."No.", Recpurchaserheader."Buy-from Vendor No.");
    //                     IF RecVendor.FINDFIRST THEN BEGIN
    //                         //----------------------------------------------------MAIL TO VENDOR START--------------------------------------------------------------------------
    //                         //VarEmailSender:='purchase@nglfinechem.com';
    //                         VarEmailSender := 'donotreply@nglfinechem.com';
    //                         //VarRecipaint:=RecVendor."E-Mail"+';'+RecVendor."E-Mail1"+';'+RecVendor."E-Mail2";
    //                         VarcompName := 'NGL Fine Chem Limited';
    //                         Varsubject := 'PO No: ' + Recpurchaserheader."No." + 'for supply to Location' + Recpurchaserheader."Location Code";//+IndentLine.Description;
    //                         SMTP.CreateMessage('Purchase Team', VarEmailSender, VarRecipaint, Varsubject, '', TRUE);
    //                         //SMTP.CreateMessage('Purchase Team',VarEmailSender,'azharuddin@pacificconsulting.in',Varsubject,'',TRUE);
    //                         SMTP.AppendBody('Dear Sir/Madam');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('Based on the quotation submitted by you, we are pleased to place the Purchase Order No. ' + '<b>' + docno + '</b>' + ', a copy of which is attached to this email. Please supply within the timelines provided');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('<table border="0">');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('<tr style="background-color:#507CD1; color:#fff">');
    //                         SMTP.AppendBody('<th> Date           </th>');
    //                         SMTP.AppendBody('<th> PO No.     </th>');
    //                         SMTP.AppendBody('<th> Item No.       </th>');
    //                         SMTP.AppendBody('<th> Description    </th>');
    //                         SMTP.AppendBody('<th> Quantity       </th>');
    //                         SMTP.AppendBody('<th> UOM            </th>');
    //                         SMTP.AppendBody('<th> Req Date       </th>');
    //                         SMTP.AppendBody('</tr>');
    //                         sr := 0;
    //                         recpurchashline.RESET;
    //                         recpurchashline.SETRANGE(recpurchashline."Document No.", docno);
    //                         IF recpurchashline.FINDFIRST THEN BEGIN
    //                             REPEAT
    //                                 sr += 1;
    //                                 pdfname := 'C:\Specification' + FORMAT(sr);
    //                                 SMTP.AppendBody('<tr style="background-color:#EFF3FB; color:black">');
    //                                 SMTP.AppendBody('<td>' + FORMAT(TODAY, 0, '<Day,2>-<Month,2>-<Year4>') + '</td>');
    //                                 SMTP.AppendBody('<td>' + FORMAT(recpurchashline."Document No.") + '</td>');
    //                                 SMTP.AppendBody('<td>' + recpurchashline."No." + '</td>');
    //                                 SMTP.AppendBody('<td>' + recpurchashline.Description + '</td>');
    //                                 SMTP.AppendBody('<td>' + FORMAT(recpurchashline.Quantity) + '</td>');
    //                                 SMTP.AppendBody('<td>' + recpurchashline."Unit of Measure" + '</td>');
    //                                 SMTP.AppendBody('<td>' + FORMAT(recpurchashline."Expected Receipt Date", 0, '<Day,2>-<Month,2>-<Year4>') + '</td>');
    //                                 SMTP.AppendBody('</tr>');
    //                             UNTIL recpurchashline.NEXT = 0;
    //                         END;
    //                         SMTP.AppendBody('</table>');
    //                         SMTP.AppendBody('<table border="0">');
    //                         SMTP.AppendBody('<tr>');
    //                         //SMTP.AppendBody('<th> Vendor Name:'   +RecVendor.Name + '</th>');
    //                         SMTP.AppendBody('</tr>');
    //                         SMTP.AppendBody('</table>');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('<br><Br>');
    //                         SMTP.AppendBody('<table border="0">');
    //                         SMTP.AppendBody('<tr>');
    //                         SMTP.AppendBody('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
    //                         SMTP.AppendBody('</tr>');
    //                         SMTP.AppendBody('<tr>');
    //                         SMTP.AppendBody('<td style="text-align:left" colspan=8><b>' + 'Purchase Team' + '</b></td>');
    //                         SMTP.AppendBody('</tr>');
    //                         SMTP.AppendBody('<tr style= "color:#507CD1">');
    //                         SMTP.AppendBody('<td style="text-align:left" colspan=8><b> ' + VarcompName + '</b></td>');
    //                         SMTP.AppendBody('</tr>');
    //                         SMTP.AppendBody('</table>');
    //                         //PCPL-0025
    //                         PurchaseHeader.RESET;
    //                         PurchaseHeader.SETRANGE(PurchaseHeader."No.", docno);
    //                         IF PurchaseHeader.FINDSET THEN BEGIN
    //                             recVend.RESET;
    //                             recVend.SETRANGE(recVend."No.", PurchaseHeader."Buy-from Vendor No.");
    //                             IF recVend.FINDFIRST THEN
    //                                 IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
    //                                     /*
    //                                     Purchase_OrderNGL_T.SETTABLEVIEW(PurchaseHeader);
    //                                     Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
    //                                     Purchase_OrderNGL_T.SAVEASPDF('C:\Purchase_Order' + '.pdf');
    //                                     CLEAR(Purchase_OrderNGL_T);
    //                                     */
    //                                     //path := 'D:\New folder (2)';
    //                                     SMTP.AddAttachment('C:\Purchase_Order' + '.pdf', '');
    //                                     // SMTP.Send;
    //                                     // MESSAGE('succussful');

    //                                 END
    //                                 ELSE BEGIN
    //                                     /* //NSW07
    //                                     Purchase_OrderFA_T.SETTABLEVIEW(PurchaseHeader);
    //                                     Purchase_OrderFA_T.USEREQUESTPAGE(FALSE);
    //                                     Purchase_OrderFA_T.SAVEASPDF('C:\Purchase_Order' + '.pdf');
    //                                     CLEAR(Purchase_OrderFA_T);
    //                                     */ //NSW07

    //                                     SMTP.AddAttachment('C:\Purchase_Order' + '.pdf', '');
    //                                     //SMTP.Send;
    //                                     //MESSAGE('Successful');

    //                                     //<<PCPL/NSW/07 14June22
    //                                     IF PurchaseHeader."Assigned User ID" <> '' THEN BEGIN
    //                                         IF RUser.GET(PurchaseHeader."Assigned User ID") THEN BEGIN
    //                                             IF RUser."E-Mail" <> '' THEN
    //                                                 UserReceipt.Add(RUser."E-Mail"); //PCPL/NSW/MIG 11July22 New Code added 
    //                                             SMTP.AddCC(UserReceipt); //PCPL/NSW/MIG 11July22 New Code added 
    //                                         END;
    //                                     END;
    //                                     //>>PCPL/NSW/07 14June22
    //                                 END;
    //                         END;
    //                         //PCPL-0025
    //                         NewReceipt.Add('purchase@nglfinechem.com,project@nglfinechem.com');   //PCPL/NSW/MIG 11July22 New Code added 
    //                         SMTP.AddCC(NewReceipt); //PCPL/NSW/MIG 11July22 New Code added 

    //                         SMTP.Send;
    //                     END;
    //                 END;
    //             END
    //             ELSE BEGIN
    //                 MESSAGE('No Email Found For this Vendor');
    //             END;

    //         END;
    //     END;//pcpl0024_10Dec2018
    // end;

    var
        NewReceipt: List of [Text];//PCPL/NSW/MIG 
        UserReceipt: List of [Text]; //PCPL/NSW/MIG 

}



