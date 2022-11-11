page 50125 "Formulatiom BOM"
{
    // version //PCPL AntiCost

    Caption = 'Formulatiom BOM';
    PageType = Document;
    SourceTable = 50045;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = all;

                    trigger OnAssistEdit();
                    begin
                        //IF AssistEdit(xRec) THEN
                        //  CurrPage.UPDATE;
                    end;
                }
                field("Item Code"; rec."Item Code")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                }
                field("Item Description"; rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field("Item Category"; rec."Item Category")
                {
                    ApplicationArea = all;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Created By User ID"; rec."Created By User ID")
                {
                    ApplicationArea = all;
                }
                field("Created DateTime"; rec."Created DateTime")
                {
                    ApplicationArea = all;
                }
                field("Certified By User ID"; rec."Certified By User ID")
                {
                    ApplicationArea = all;
                }
                field("Certified DateTime"; rec."Certified DateTime")
                {
                    ApplicationArea = all;
                }
                field("Approval Status"; rec."Approval Status")
                {
                    ApplicationArea = all;
                }
                field("Total Quantity"; rec."Total Quantity")
                {
                    ApplicationArea = all;
                }
            }
            part(Newpart; 50126)
            {
                SubPageLink = "Formulation BOM No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CalculateLines)
            {
                CaptionML = ENU = 'CalculateLines',
                            ENN = 'Copy &BOM';
                Ellipsis = true;
                Image = CopyBOM;

                trigger OnAction();
                begin
                    rec.TESTFIELD("No.");
                    ProdBOMHeader.RESET;
                    ProdBOMHeader.SETRANGE(Status, ProdBOMHeader.Status::Certified);
                    IF ProdBOMHeader.FINDSET THEN
                        //IF PAGE.RUNMODAL(0,ProdBOMHeader) = ACTION::LookupOK THEN
                        rec.CopyBOM(ProdBOMHeader);
                end;
            }
            action(Submit)
            {
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                begin
                    /*recFBOMLine.RESET;
                    recFBOMLine.SETRANGE("Formulation BOM No.","No.");
                    IF recFBOMLine.FINDSET THEN REPEAT
                      recFBOMLine.TESTFIELD("Cost Amount");
                    UNTIL recFBOMLine.NEXT=0;
                    IF CONFIRM(TEXT002,TRUE) THEN BEGIN
                      SubmitDoc;
                    END;
                    */

                end;
            }
            action(Archive)
            {
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //RunObject = Page 50401;
                //RunPageLink = Field1 = FIELD("No.");
                Visible = false;
            }
        }
    }

    var
        ProdBOMHeader: Record 99000771;
        TEXT002: Label 'Do you want to Submit?';
        recFBOMLine: Record 50046;
}

