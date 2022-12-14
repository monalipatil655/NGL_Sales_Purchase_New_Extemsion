page 50101 "Forward Commission List"
{
    // version PCPL/Avinash/0028

    CardPageID = "Forward Commission Header";
    PageType = List;
    SourceTable = 50040;
    SourceTableView = SORTING("Entry No.", "Forward No.")
                      ORDER(Ascending)
                      WHERE(Select = CONST(false));
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                    trigger OnAssistEdit();
                    begin
                        IF rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Date of Booking"; rec."Date of Booking")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Past Performance Balance"; rec."Past Performance Balance")
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Maturity  Date"; rec."Maturity  Date")
                {
                    ApplicationArea = all;
                }
                field("Fwd Exchage Rate"; rec."Fwd Exchage Rate")
                {
                    ApplicationArea = all;
                }
                field("Spot Rate at time of booking"; rec."Spot Rate at time of booking")
                {
                    ApplicationArea = all;
                }
                field(Premium; rec.Premium)
                {
                    ApplicationArea = all;
                }
                field("Utilisation Date"; rec."Utilisation Date")
                {
                    ApplicationArea = all;
                }
                field("Utilized in export"; rec."Utilized in export")
                {
                    ApplicationArea = all;
                }
                field("Pre-utilization rate"; rec."Pre-utilization rate")
                {
                    ApplicationArea = all;
                }
                field("Pre-util.Charges(pro-rata)"; rec."Pre-util.Charges(pro-rata)")
                {
                    ApplicationArea = all;
                }
                field("Spot rate at the time of util."; rec."Spot rate at the time of util.")
                {
                    ApplicationArea = all;
                }
                field("Profit/Loss"; rec."Profit/Loss")
                {
                    ApplicationArea = all;
                }
                field("Forward No."; rec."Forward No.")
                {
                    ApplicationArea = all;
                }
                field("Remaining Performance Balance"; rec."Remaining Performance Balance")
                {
                    ApplicationArea = all;
                }
                field("Remaining Amount"; rec."Remaining Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            // Caption = 'General';
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
                    ForexTwo.INSERT;
                    rec.Select := TRUE;
                    rec.MODIFY;
                end;
            }
        }
    }

    var
        Text001: TextConst ENU = 'Do you want to post the %1?', ENN = 'Do you want to post the %1?';
        ForexTwo: Record 50039;
}

