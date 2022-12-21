Codeunit 50001 PurchPost_Ex
{
    trigger OnRun()
    var
    //myInt: Integer;
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchLine', '', false, false)]
    //[IntegrationEvent(false, false)]
    local procedure OnAfterPostPurchLine(var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean; var PurchInvLine: Record "Purch. Inv. Line"; var PurchCrMemoLine: Record "Purch. Cr. Memo Line"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var PurchLineACY: Record "Purchase Line"; GenJnlLineDocType: Enum "Gen. Journal Document Type"; GenJnlLineDocNo: Code[20]; GenJnlLineExtDocNo: Code[35]; SrcCode: Code[10])
    var
        FADepreciationBook: Record 5612;
    begin
        //PCPL-FA Start
        IF PurchInvLine.Type = PurchInvLine.Type::"Fixed Asset" THEN BEGIN
            FADepreciationBook.RESET;
            FADepreciationBook.SETRANGE("FA No.", PurchInvLine."No.");
            FADepreciationBook.SETFILTER("Depreciation Starting Date", '%1', 0D);
            IF FADepreciationBook.FINDSET THEN
                REPEAT
                    FADepreciationBook."Depreciation Starting Date" := PurchInvHeader."Posting Date";
                    FADepreciationBook.MODIFY;
                UNTIL FADepreciationBook.NEXT = 0;
        END;
        //PCPL-FA end        

    end;

}