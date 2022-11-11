pageextension 50018 Purchase_order_Ext extends "Purchase Order"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,PCPL/NGL/001,PCPL/QC/V3/001,PCPL-25/INCDoc,PCPL/NSW/07 01June22

    layout
    {


        addafter("Job Queue Status")
        {
            field("Reason Code"; rec."Reason Code")
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {

            field("Quoation Date"; rec."Quoation Date")
            {
                ApplicationArea = all;
            }
            field("Quotation No1"; rec."Quotation No")
            {
                Caption = 'Quotation No1';
                ApplicationArea = all;
            }
            field("Quotation No"; PH."Quotation No")
            {
                ApplicationArea = all;
            }
            field(Freight; rec.Freight)
            {
                ApplicationArea = all;
            }
            field("Loading/Unloading Charges"; rec."Loading/Unloading Charges")
            {
                ApplicationArea = all;
            }
            field(Packingdetails; rec.PackingDetails)
            {
                ApplicationArea = all;
            }
            field("Packing and Forwarding"; rec."Rjected Remarks")
            {
                ApplicationArea = all;
            }
        }

    }
    actions
    {




        // modify(Approve)
        // {
        //     trigger OnAfterAction()
        //     begin
        //         //pcpl0024--start
        //         recpurchheadr.RESET;
        //         recpurchheadr.SETRANGE(recpurchheadr."No.", vardocno);
        //         IF recpurchheadr.FINDFIRST THEN BEGIN
        //             IF recpurchheadr.Status = recpurchheadr.Status::"Pending Approval" THEN BEGIN
        //                 //  codeDocApp.SendMail(recpurchheadr."No.", varuserid); //NSW07
        //             END;
        //         END;

        //         //pcpl0024--end

        //     end;
        // }

        // modify(Release)
        // {
        //     trigger OnBeforeAction()
        //     begin
        //         //PCPL 38
        //         IF "Buy-from Vendor No." <> "Pay-to Vendor No." THEN
        //             ERROR('Check Buy from vendor no and Pay to vendor no');

        //     end;

        //     trigger OnAfterAction()
        //     begin
        //         //PCPL 38

        //         TESTFIELD("Location Code");//PCPL
        //         IF "PO Created" THEN
        //             PortalVendUpdatedPurchRec.RESET;
        //         PortalVendUpdatedPurchRec.SETRANGE("PO Created", TRUE);
        //         PortalVendUpdatedPurchRec.SETRANGE("PO Status", PortalVendUpdatedPurchRec."PO Status"::"Processed For PO");//Added PCPL 0028
        //         IF PortalVendUpdatedPurchRec.FINDSET THEN
        //             REPEAT
        //                 //PortalVendUpdatedPurchRec.VALIDATE("PO Status",PortalVendUpdatedPurchRec."PO Status"::"Processed For PO");//Comment PCPL 0028
        //                 PortalVendUpdatedPurchRec."PO Status" := PortalVendUpdatedPurchRec."PO Status"::Closed;//Added PCPL 0028
        //                 PortalVendUpdatedPurchRec.MODIFY;
        //             UNTIL PortalVendUpdatedPurchRec.NEXT = 0;

        //         //pcpl0024--start
        //         recPurchLine.RESET;
        //         recPurchLine.SETRANGE(recPurchLine."Document No.", "No.");
        //         IF recPurchLine.FINDSET THEN
        //             REPEAT
        //             BEGIN
        //                 RecPurchaseAproval.RESET;
        //                 RecPurchaseAproval.SETRANGE(RecPurchaseAproval."Document No.", recPurchLine."Indent No.");
        //                 RecPurchaseAproval.SETRANGE(RecPurchaseAproval."No.", recPurchLine."No.");
        //                 IF RecPurchaseAproval.FINDSET THEN
        //                     REPEAT
        //                     BEGIN
        //                         RecPurchaseAproval."PO Status" := RecPurchaseAproval."PO Status"::Close;
        //                         RecPurchaseAproval.MODIFY(TRUE);
        //                     END;
        //                     UNTIL RecPurchaseAproval.NEXT = 0;
        //             END;
        //             UNTIL recPurchLine.NEXT = 0;
        //         //pcpl0024--end


        //     end;
        //}
        modify(Reopen)
        {
            trigger OnBeforeAction()
            begin
                rec.TESTFIELD(rec."Reason Code"); //PCPL0017
            end;
        }




        modify(CancelApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                rec.TESTFIELD(rec."Reason Code"); //PCPL0017
            end;
        }


        addafter("&Print")
        {

            action("Close PO")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    Txt001: Label 'Do you want close this PO?';
                begin
                    IF CONFIRM(Txt001) THEN BEGIN
                        rec."Closed PO" := TRUE;
                        rec.MODIFY;
                        MESSAGE('PO has been closed');
                    END;
                end;
            }
        }


    }

    var
        // PortalVendUpdatedPurchRec: Record 50032;

        // SalesHeader: Record 36;
        SalesHeader: Record 38;

        OrdQty: Decimal;
        recPurchLine: Record 39;
        recItem: Record 27;
        tempPurchLine: Record 39;
        Lot: Code[20];
        recTempGrn: Record 120;
        recReservationEntry: Record 337;
        PHEader: Record 38;
        PH: Record 38;
        PurchRcptHeader: Record 120;
        PurchRcptLine: Record 121;

        RecVendor: Record 23;
        SalesHeader1: Record 38;
        UserSetup5: Record 91;
        UserSetup4: Record 91;
        UserSetup3: Record 91;
        UserSetup2: Record 91;
        UserSetup: Record 91;
        //SMTP: Codeunit 400;//PCPL/NSW/07 03Nov22
        RecPurchLinen: Record 39;
        RecVendorn: Record 23;
        txtLink: Text[1000];
        VarFinalDes: Text[150];
        VarFinalDesVariant: Text[150];
        RecVariantn: Record 5401;
        FinalAmount: Decimal;
        recPaymentTerms: Record 3;
        VarPayment: Text[150];
        VarRecipaintMail: Text[50];
        VarRecipaintMail1: list of [text];
        VarSenderMail: Text[50];
        RecUsers: Record 2000000120;
        PurchaseHeader: Record 38;
        recVend: Record 23;
        //Purchase_OrderNGL_T: Report 50035; //NSW07
        Attachpdf: Text;
        PdfDocPath: Text;
        path: Text;
        PdfDocPath1: Text;
        Path1: Text;
        //Purchase_OrderFA_T: Report 50036; //NSW07
        varuserid: Code[50];
        recpurchheadr: Record 38;
        // codeDocApp: Codeunit 50012; //NSW07
        vardocno: Code[30];
        varsendoname: Code[150];
        RecPurchaseAproval: Record 50028;
        recpurchseline: Record 39;
        // recquatationrec: Record 50032;
        sr: Integer;
        pdfname: Text[150];
        //repindent: Report 50070; //NSW07
        reccomment: Record 43;
        VerComment: Text[250];
        RecApprovecpmentline: Record 455;
        VerApprCommLine: Text[250];
        TEMP: Text[250];
        IncomingDocumentAttachment: Record 133;
        IncoPath: Text;

    //NSW07  All code commented
    // local procedure SendMail();
    // begin
    //     //To Catch Approvar Mail ID--Start
    //     UserSetup2.RESET;
    //     UserSetup2.SETRANGE(UserSetup2."User ID", USERID);

    //     IF UserSetup2.FINDFIRST THEN
    //         VarSenderMail := UserSetup2."E-Mail";
    //     BEGIN
    //         UserSetup3.RESET;
    //         UserSetup3.SETRANGE(UserSetup3."User ID", UserSetup2."Approver ID");
    //         IF UserSetup3.FINDFIRST THEN BEGIN
    //             VarRecipaintMail1.add(UserSetup3."E-Mail");
    //         END;
    //     END;
    //     //To Catch Approvar Mail ID--End

    //     /*
    //     //To Catch Sender Mail ID--Start
    //     RecUsers.RESET;
    //     RecUsers.SETRANGE(RecUsers."User Name",USERID);
    //     IF RecUsers.FINDFIRST THEN
    //     BEGIN
    //         VarSenderMail:=RecUsers."Contact Email";
    //     END;

    //     //To Catch Sender Mail ID--End
    //     */
    //     //MESSAGE(VarSenderMail);
    //     //MESSAGE(VarRecipaintMail);
    //     UserSetup.RESET;
    //     UserSetup.SETRANGE(UserSetup."User ID", USERID);
    //     IF UserSetup.FINDFIRST THEN;
    //     varsendoname := 'PO Approval ' + "No.";
    //     SMTP.CreateMessage(varsendoname, VarSenderMail, VarRecipaintMail1, 'Purchase Approval Process', '', TRUE);
    //     //SMTP.CreateMessage('PO Approval','itmumbai@nglfinechem.com','itmumbai@nglfinechem.com','Purchase Approval Process','',TRUE);
    //     SMTP.AppendBody('Dear Sir/Madam');
    //     SMTP.AppendBody('<br><Br>');
    //     SMTP.AppendBody('Kindly apporve below mentioned Purchase Order.');
    //     SMTP.AppendBody('<br><Br>');

    //     //pcpl0024_08Feb2019
    //     RecApprovecpmentline.RESET;
    //     RecApprovecpmentline.SETRANGE(RecApprovecpmentline."Table ID", 38);
    //     RecApprovecpmentline.SETRANGE(RecApprovecpmentline."Record ID to Approve", RECORDID);
    //     IF RecApprovecpmentline.FINDFIRST THEN
    //     BEGIN
    //         REPEAT
    //             //VerApprCommLine:=
    //             SMTP.AppendBody('Approval Comment (' + FORMAT(RecApprovecpmentline."Date and Time") + ')' + ': ' + RecApprovecpmentline.Comment);
    //             SMTP.AppendBody('<br><Br>');
    //         UNTIL RecApprovecpmentline.NEXT = 0;
    //     END;
    //     //pcpl0024_08Feb2019

    //     SMTP.AppendBody('<table border="1">');
    //     SMTP.AppendBody('<tr>');
    //     SMTP.AppendBody('<th> Purchase Order No. ' + '</th>');
    //     SMTP.AppendBody('<th> Vendor Name  </th>');
    //     SMTP.AppendBody('<th> Item No.  </th>');
    //     SMTP.AppendBody('<th> Item Description  </th>');
    //     //SMTP.AppendBody('<th> Variant Description  </th>');
    //     SMTP.AppendBody('<th> Quantity  </th>');
    //     SMTP.AppendBody('<th> UOM  </th>');
    //     SMTP.AppendBody('<th> Rate </th>');
    //     SMTP.AppendBody('<th> Amount </th>');
    //     SMTP.AppendBody('<th> Gst% </th>');
    //     SMTP.AppendBody('<th> Total value  </th>');
    //     SMTP.AppendBody('<th> Payment Terms  </th>');
    //     SMTP.AppendBody('<th> Delivery Date  </th>');
    //     SMTP.AppendBody('<th> Location  </th>');//pcpl0024--10Dec2018
    //     SMTP.AppendBody('<th> Comment  </th>');//pcpl0024--10Dec2018
    //     SMTP.AppendBody('<th> Indent No.  </th>');//pcpl0024--10Dec2018
    //     SMTP.AppendBody('</tr>');
    //     SMTP.AppendBody('<tr>');

    //     //pcpl0024-29oct2018--start
    //     //IF USERID ='NGLHO\ADMINISTRATOR' THEN
    //     //BEGIN
    //     recpurchseline.RESET;
    //     recpurchseline.SETRANGE(recpurchseline."Document No.", "No.");
    //     IF recpurchseline.FINDSET THEN BEGIN
    //         REPEAT
    //             recquatationrec.RESET;
    //             recquatationrec.SETRANGE(recquatationrec."Document No.", recpurchseline."Indent No.");
    //             recquatationrec.SETRANGE(recquatationrec."No.", recpurchseline."No.");//pcpl0024_24jan2019
    //             recquatationrec.SETRANGE(recquatationrec."Line No.", recpurchseline."Quatation recieved Line No.");//pcpl0024_12Feb2019
    //             IF recquatationrec.FINDFIRST THEN BEGIN
    //                 sr += 1;
    //                 //pdfname:='D:\IndentList'+FORMAT(sr);
    //                 pdfname := 'C:\Comparison' + FORMAT(sr);//pcpl0024_24jan2019  //PCPL/NSW/270522 Form E to C drive
    //                 /* //NSW07
    //                 repindent.SETTABLEVIEW(recquatationrec);
    //                 repindent.USEREQUESTPAGE(FALSE);
    //                 repindent.SAVEASEXCEL(pdfname + '.xls');
    //                 CLEAR(repindent);
    //                 */ //NSW07

    //                 SMTP.AddAttachment(pdfname + '.xls', '');
    //             END;
    //         UNTIL recpurchseline.NEXT = 0
    //     END;
    //     //END;
    //     //pcpl0024-29oct2018--End
    //     recPaymentTerms.RESET;
    //     recPaymentTerms.SETRANGE(recPaymentTerms.Code, "Payment Terms Code");
    //     IF recPaymentTerms.FINDFIRST THEN
    //         VarPayment := recPaymentTerms.Description;


    //     RecPurchLinen.RESET;
    //     RecPurchLinen.SETRANGE("Document No.", "No.");
    //     IF RecPurchLinen.FINDSET THEN
    //         REPEAT

    //             FinalAmount := 0;
    //             VarFinalDes := RecPurchLinen.Description + RecPurchLinen."Description 2";
    //             FinalAmount := RecPurchLinen.Quantity * RecPurchLinen."Unit Cost";
    //             //To Catch Variant Code
    //             RecVariantn.RESET;
    //             RecVariantn.SETRANGE(RecVariantn.Code, RecPurchLinen."Variant Code");
    //             IF RecVariantn.FINDFIRST THEN BEGIN
    //                 VarFinalDesVariant := RecVariantn.Description + RecVariantn."Description 2";
    //             END;

    //             SMTP.AppendBody('<td>' + "No." + '</td>');
    //             SMTP.AppendBody('<td>' + "Buy-from Vendor Name" + '</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."No.") + '</td>');
    //             SMTP.AppendBody('<td>' + VarFinalDes + '</td>');
    //             //SMTP.AppendBody('<td>'  + VarFinalDesVariant+'</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen.Quantity) + '</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Unit of Measure Code") + '</td>');//pcpl0024-10dec2018
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Unit Cost") + '</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(FinalAmount) + '</td>');
    //             // SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."GST %") + '</td>');
    //             //SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Amount To Vendor") + '</td>');
    //             SMTP.AppendBody('<td>' + VarPayment + '</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Expected Receipt Date") + '</td>');
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Location Code") + '</td>');//pcpl0024-10dec2018
    //                                                                                       //pcpl0024-10dec2018--start
    //             VerComment := '';
    //             reccomment.RESET;
    //             reccomment.SETRANGE(reccomment."No.", "No.");
    //             reccomment.SETRANGE(reccomment."Document Line No.", 0);
    //             IF reccomment.FINDSET THEN BEGIN
    //                 REPEAT
    //                     VerComment += reccomment.Comment;
    //                 UNTIL reccomment.NEXT = 0;
    //             END;
    //             //pcpl0024-10dec2018--End
    //             SMTP.AppendBody('<td>' + FORMAT(VerComment) + '</td>');//pcpl0024-10dec2018
    //             SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Indent No.") + '</td>');//pcpl0024-10dec2018


    //             SMTP.AppendBody('</tr>');

    //         UNTIL RecPurchLinen.NEXT = 0;
    //     SMTP.AppendBody('</table>');
    //     SMTP.AppendBody('<br><Br>');
    //     //txtLink :=  'http://192.168.2.100:81/ApprovalPage.aspx?documentNo=""&user=""'+"No."+'&user='+FORMAT(UserSetup."Approver ID");
    //     //PCPL-25
    //     IF COMPANYNAME = 'Macrotech Polychem Pvt. Ltd.' THEN
    //         txtLink := 'http://20.198.67.21/webapproval/macrotechapproval.aspx?documentNo=' + "No." + '&user=' + FORMAT(UserSetup."Approver ID") //New Code add PCPL/NSW/07 01June22 Below original Coe comment  //port change 639 to 82
    //                                                                                                                                              //txtLink :='http://43.250.208.210:82/ApprovalPage.aspx?documentNo='+"No."+'&user='+FORMAT(UserSetup."Approver ID")
    //     ELSE
    //         IF COMPANYNAME = 'Vetfar Pharma. Pvt. Ltd.' THEN
    //             txtLink := 'http://20.198.67.21/webapproval/vetfarapproval.aspx?documentNo=' + "No." + '&user=' + FORMAT(UserSetup."Approver ID") //New Code add PCPL/NSW/07 new Code add for new company
    //         ELSE //PCPL-25
    //             txtLink := 'http://20.198.67.21/webapproval/approvalpage.aspx?documentNo=' + "No." + '&user=' + FORMAT(UserSetup."Approver ID");  //New Code add PCPL/NSW/07 01June22 Below original Coe comment
    //                                                                                                                                               //txtLink :='http://43.250.208.210/ApprovalPage.aspx?documentNo='+"No."+'&user='+FORMAT(UserSetup."Approver ID");
    //     SMTP.AppendBody('<p><a href="' + txtLink + '"><b>Click To Approve</b></a></p>');

    //     /*
    //     //
    //     PurchaseHeader.RESET;
    //     PurchaseHeader.SETRANGE(PurchaseHeader."No.","No.");
    //     IF PurchaseHeader.FINDFIRST THEN BEGIN
    //       recVend.RESET;
    //       recVend.SETRANGE(recVend."No.",PurchaseHeader."Buy-from Vendor No.");
    //       IF recVend.FINDFIRST THEN
    //         IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
    //           //Attechpdf := FORMAT(Report.SAVEASPDF(50035,'Desktop:MyReportsreport50035Demo.pdf',PurchaseHeader));
    //           //SMTP.AddAttachment(Attachpdf,);
    //           PdfDocPath := 'Purchase_OrderNGL_T.pdf';
    //           path := 'Desktop:'+PdfDocPath;
    //           CLEAR(Purchase_OrderNGL_T);
    //           SMTP.AddAttachment(path,PdfDocPath);
    //           SMTP.Send;
    //         END
    //       ELSE
    //         PdfDocPath1 := 'Purchase_OrderFA_T.pdf';
    //         Path1 := 'Desktop:' + PdfDocPath1;
    //         CLEAR(Purchase_OrderFA_T);
    //         SMTP.AddAttachment(Path1,PdfDocPath1);
    //         SMTP.Send;
    //     END;
    //     //
    //     */

    //     //PCPL-25/INCDoc
    //     IncomingDocumentAttachment.RESET;
    //     IncomingDocumentAttachment.SETRANGE("Incoming Document Entry No.", "Incoming Document Entry No.");
    //     IF IncomingDocumentAttachment.FINDFIRST THEN
    //         REPEAT
    //             //IncoPath := IncomingDocumentAttachment.Name+'-'+FORMAT(IncomingDocumentAttachment."Incoming Document Entry No.")+'-'+FORMAT(IncomingDocumentAttachment."Line No.")+'.'+IncomingDocumentAttachment."File Extension";
    //             IncoPath := IncomingDocumentAttachment."File Path";
    //             SMTP.AddAttachment(IncoPath, '');
    //         UNTIL IncomingDocumentAttachment.NEXT = 0;
    //     //PCPL-25/INCDoc

    //     SMTP.Send;

    // end;
    //NSW07
    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyDeletion. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

