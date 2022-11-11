page 50086 "Forward Commission Header S"
{
    // version PCPL/Avinash/0028

    CaptionML = ENU = 'Forward Commission Header',
                ENN = 'Forward Commission Header';
    PageType = Card;
    Permissions =;
    SourceTable = 50100;
    SourceTableView = SORTING("Entry No.", "Forward No.")
                      ORDER(Ascending)
                      WHERE(Select = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = ALL;

                    trigger OnAssistEdit();
                    begin
                        IF rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = ALL;
                }
                field("Date of Booking"; rec."Date of Booking")
                {
                    ApplicationArea = ALL;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = ALL;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = ALL;
                }
                field("Past Performance Balance"; rec."Past Performance Balance")
                {
                    ApplicationArea = ALL;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = ALL;
                }
                field("Maturity  Date"; rec."Maturity  Date")
                {
                    ApplicationArea = ALL;
                }
                field("Fwd Exchage Rate"; rec."Fwd Exchage Rate")
                {
                    ApplicationArea = ALL;
                }
                field("Spot Rate at time of booking"; rec."Spot Rate at time of booking")
                {
                    ApplicationArea = ALL;
                }
                field(Premium; rec.Premium)
                {
                    ApplicationArea = ALL;
                }
                field("Utilisation Date"; rec."Utilisation Date")
                {
                    ApplicationArea = ALL;
                }
                field("Utilized in export"; rec."Utilized in export")
                {
                    ApplicationArea = ALL;
                }
                field("Pre-utilization rate"; rec."Pre-utilization rate")
                {
                    ApplicationArea = ALL;
                }
                field("Pre-util.Charges(pro-rata)"; rec."Pre-util.Charges(pro-rata)")
                {
                    ApplicationArea = ALL;
                }
                field("Spot rate at the time of util."; rec."Spot rate at the time of util.")
                {
                    ApplicationArea = ALL;
                }
                field("Profit/Loss"; rec."Profit/Loss")
                {
                    ApplicationArea = ALL;
                }
                field("Forward No."; rec."Forward No.")
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Performance Balance"; rec."Remaining Performance Balance")
                {
                    ApplicationArea = ALL;
                }
                field("Remaining Amount"; rec."Remaining Amount")
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            //Caption = 'General';
            action("Post Commission ")
            {
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF NOT
                      CONFIRM(
                        Text001, FALSE,
                        '') THEN
                        EXIT;
                    ForexTwo.INIT;
                    ForexTwo.TRANSFERFIELDS(Rec);
                    ForexTwo."Entry No." := ForexTwo."Entry No." + 1;
                    // ForexTwo."Document No." := "Document No.";
                    ForexTwo.INSERT;
                    rec.Select := TRUE;
                    rec.MODIFY;
                end;
            }
        }
    }

    var
        ForexTwo: Record 50039;
        ForwardCommissionHeader: Record 50100;
        Text001: TextConst ENU = 'Do you want to post the %1?', ENN = 'Do you want to post the %1?';
}

