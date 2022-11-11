pageextension 50047 Approval_Request_Entries extends "Approval Request Entries"
{
    // version NAVW19.00.00.45778

    actions
    {

        modify("&Delegate")
        {
            trigger OnBeforeAction()
            begin
                SendMailDelgate;
            end;
        }
    }

    var
        // SMTP: Codeunit 400;
        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;

        RecPurchLinen: Record 39;
        RecVendorn: Record 23;
        txtLink: Text[1000];
        VarFinalDes: Text[150];
        VarFinalDesVariant: Text[150];
        RecVariantn: Record 5401;
        FinalAmount: Decimal;
        RecPurchHeadn: Record 38;
        UserSetup5: Record 91;
        UserSetup4: Record 91;
        UserSetup3: Record 91;
        UserSetup2: Record 91;
        VarRecipaintMail: Text[50];
        VarRecipaintMail11: List of [Text];
        VarSenderMail: Text[50];
        RecUsers: Record 2000000120;
        vardocno: Code[30];
        recpurchheadr: Record 38;
        varuserid: Code[30];
        recusersetupapp: Record 91;
        recpurchasehdapp: Record 38;
        recPaymentTerms: Record 3;
        VarPayment: Text[150];
        varuserapproval: Code[50];
        PurchaseHeader: Record 38;
        //Purchase_OrderNGL_T: Report 50035;
        PathDocPdf1: Text;
        path1: Text;
        // Purchase_OrderFA_T: Report 50036;
        name: Text[250];
        ToFile: Text[250];
        FileName: Text;
        FileName1: Text;
        name1: Text[250];
        recVend: Record 23;
        Varsendorname: Code[50];
        Usersetup: Record 91;

    local procedure SendMailDelgate();
    var
        ApprovalEntry: Record 454;
    begin
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        IF ApprovalEntry.FINDSET THEN BEGIN
            //To Catch Approvar Mail ID--Start
            UserSetup2.RESET;
            UserSetup2.SETRANGE(UserSetup2."User ID", USERID);
            IF UserSetup2.FINDFIRST THEN BEGIN
                VarSenderMail := UserSetup2."E-Mail";
                UserSetup3.RESET;
                UserSetup3.SETRANGE(UserSetup3."User ID", UserSetup2.Substitute);
                IF UserSetup3.FINDFIRST THEN BEGIN
                    VarRecipaintMail := UserSetup3."E-Mail";
                    VarRecipaintMail11.Add(UserSetup3."E-Mail");
                    varuserapproval := UserSetup3."User ID";
                END;
            END;

            IF VarRecipaintMail = '' THEN BEGIN
                UserSetup2.RESET;
                UserSetup2.SETRANGE(UserSetup2."User ID", USERID);
                IF UserSetup2.FINDFIRST THEN BEGIN
                    VarSenderMail := UserSetup2."E-Mail";
                    UserSetup3.RESET;
                    UserSetup3.SETRANGE(UserSetup3."User ID", UserSetup2."Approver ID");
                    IF UserSetup3.FINDFIRST THEN BEGIN
                        UserSetup4.RESET();
                        UserSetup4.SETRANGE(UserSetup4."User ID", UserSetup3.Substitute);
                        IF UserSetup4.FINDFIRST THEN BEGIN
                            VarRecipaintMail := UserSetup4."E-Mail";
                            VarRecipaintMail11.Add(UserSetup4."E-Mail");
                            varuserapproval := UserSetup4."User ID";
                        END;
                    END;
                END;
            END;
            //To Catch Approvar Mail ID--End



            Usersetup.RESET;
            Usersetup.SETRANGE(Usersetup."User ID", USERID);
            IF Usersetup.FINDFIRST THEN;
            Varsendorname := 'PO Approval Process' + ApprovalEntry."Document No.";
            //SMTP.CreateMessage(Varsendorname, VarSenderMail, VarRecipaintMail11, 'Purchase Approval Process', '', TRUE);
            BodyText.AddText('Dear Sir/Madam');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('Kindly apporve below mentioned Purchase Order.');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('<table border="1">');
            BodyText.AddText('<tr>');
            BodyText.AddText('<th> Purchase Order No. ' + '</th>');
            BodyText.AddText('<th> Vendor Name  </th>');
            BodyText.AddText('<th> Item No.  </th>');
            BodyText.AddText('<th> Item Description  </th>');
            //SMTP.AppendBody('<th> Variant Description  </th>');
            BodyText.AddText('<th> Quantity  </th>');
            BodyText.AddText('<th> Rate </th>');
            BodyText.AddText('<th> Amount </th>');
            BodyText.AddText('<th> Gst% </th>');
            BodyText.AddText('<th> Total value  </th>');
            BodyText.AddText('<th> Payment Terms  </th>');
            BodyText.AddText('<th> Delivery Date  </th>');
            BodyText.AddText('</tr>');
            BodyText.AddText('<tr>');


            //1oct2018--start
            recpurchasehdapp.RESET;
            recpurchasehdapp.SETRANGE(recpurchasehdapp."No.", ApprovalEntry."Document No.");
            IF recpurchasehdapp.FINDFIRST THEN BEGIN
                recPaymentTerms.RESET;
                recPaymentTerms.SETRANGE(recPaymentTerms.Code, recpurchasehdapp."Payment Terms Code");
                IF recPaymentTerms.FINDFIRST THEN
                    VarPayment := recPaymentTerms.Description;


                RecPurchLinen.RESET;
                RecPurchLinen.SETRANGE("Document No.", recpurchasehdapp."No.");
                IF RecPurchLinen.FINDSET THEN
                    REPEAT

                        FinalAmount := 0;
                        VarFinalDes := RecPurchLinen.Description + RecPurchLinen."Description 2";
                        FinalAmount := RecPurchLinen.Quantity * RecPurchLinen."Unit Cost";
                        //To Catch Variant Code
                        RecVariantn.RESET;
                        RecVariantn.SETRANGE(RecVariantn.Code, RecPurchLinen."Variant Code");
                        IF RecVariantn.FINDFIRST THEN BEGIN
                            VarFinalDesVariant := RecVariantn.Description + RecVariantn."Description 2";
                        END;

                        BodyText.AddText('<td>' + recpurchasehdapp."No." + '</td>');
                        BodyText.AddText('<td>' + recpurchasehdapp."Buy-from Vendor Name" + '</td>');
                        BodyText.AddText('<td>' + FORMAT(RecPurchLinen."No.") + '</td>');
                        BodyText.AddText('<td>' + VarFinalDes + '</td>');
                        //SMTP.AppendBody('<td>'  + VarFinalDesVariant+'</td>');
                        BodyText.AddText('<td>' + FORMAT(RecPurchLinen.Quantity) + '</td>');
                        BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Unit Cost") + '</td>');
                        BodyText.AddText('<td>' + FORMAT(FinalAmount) + '</td>');
                        //SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."GST %") + '</td>');
                        //SMTP.AppendBody('<td>' + FORMAT(RecPurchLinen."Amount To Vendor") + '</td>');
                        BodyText.AddText('<td>' + VarPayment + '</td>');
                        BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Expected Receipt Date") + '</td>');


                        BodyText.AddText('</tr>');

                    UNTIL RecPurchLinen.NEXT = 0;
                BodyText.AddText('</table>');
                BodyText.AddText('<br><Br>');
                //txtLink :=  'http://192.168.2.100:81/ApprovalPage.aspx?documentNo=""&user=""'+"No."+'&user='+FORMAT(UserSetup."Approver ID");
                txtLink := 'http://43.250.208.210/ApprovalPage.aspx?documentNo=' + recpurchasehdapp."No." + '&user=' + FORMAT(varuserapproval);
                BodyText.AddText('<p><a href="' + txtLink + '"><b>Click To Approve</b></a></p>');
                /*
                //PCPL-0025
                PurchaseHeader.RESET;
                PurchaseHeader.SETRANGE(PurchaseHeader."No.",recpurchasehdapp."No.");
                  IF PurchaseHeader.FINDSET THEN BEGIN
                    recVend.RESET;
                    recVend.SETRANGE(recVend."No.",PurchaseHeader."Buy-from Vendor No.");
                      IF recVend.FINDFIRST THEN
                        IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN

                           Purchase_OrderNGL_T.SETTABLEVIEW(PurchaseHeader);
                           Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                           Purchase_OrderNGL_T.SAVEASPDF('D:\Purchase_Order'+'.pdf');
                           CLEAR(Purchase_OrderNGL_T);
                            //path := 'D:\New folder (2)';
                            SMTP.AddAttachment('D:\Purchase_Order'+'.pdf','');
                           // SMTP.Send;
                           // MESSAGE('succussful');

                        END
                        ELSE BEGIN
                        Purchase_OrderFA_T.SETTABLEVIEW(PurchaseHeader);
                        Purchase_OrderFA_T.USEREQUESTPAGE(FALSE);
                        Purchase_OrderFA_T.SAVEASPDF('D:\Purchase_Order' +'.pdf');
                        CLEAR(Purchase_OrderFA_T);
                        SMTP.AddAttachment('D:\Purchase_Order' +'.pdf','');
                        //SMTP.Send;
                        //MESSAGE('Successful');
                        END;
                   END;
                //PCPL-0025
                */
                /*
                //
                PurchaseHeader.RESET;
                PurchaseHeader.SETRANGE(PurchaseHeader."No.","No.");
                IF PurchaseHeader.FINDFIRST THEN BEGIN
                  recVend.RESET;
                  recVend.SETRANGE(recVend."No.",PurchaseHeader."Buy-from Vendor No.");
                  IF recVend.FINDFIRST THEN
                    IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
                      //Attechpdf := FORMAT(Report.SAVEASPDF(50035,'Desktop:MyReportsreport50035Demo.pdf',PurchaseHeader));
                      //SMTP.AddAttachment(Attachpdf,);
                      PdfDocPath := 'Purchase_OrderNGL_T.pdf';
                      path := 'Desktop:'+PdfDocPath;
                      CLEAR(Purchase_OrderNGL_T);
                      SMTP.AddAttachment(path,PdfDocPath);
                      SMTP.Send;
                    END
                  ELSE
                    PdfDocPath1 := 'Purchase_OrderFA_T.pdf';
                    Path1 := 'Desktop:' + PdfDocPath1;
                    CLEAR(Purchase_OrderFA_T);
                    SMTP.AddAttachment(Path1,PdfDocPath1);
                    SMTP.Send;
                END;
                //
                */
            END;
            //SMTP.Send;
            EmailMessage.Create(VarRecipaintMail11, Varsendorname, Format(BodyText), true);
            EMail.Send(EmailMessage, Enum::"Email Scenario"::Default);
        END;

    end;
}

