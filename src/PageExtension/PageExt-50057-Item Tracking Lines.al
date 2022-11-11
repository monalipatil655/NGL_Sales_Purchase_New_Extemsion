pageextension 50057 Item_Tracking_Lines extends "Item Tracking Lines"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,KAR1.0.PCPL/NGL/002

    layout
    {
        modify(CurrentSourceCaption)
        {
            Visible = false;
        }

        addafter("New Expiration Date")
        {
            field("Creation Date"; rec."Creation Date")
            {
                CaptionML = ENU = 'Manufacturing Date',
                            ENN = 'Manufacturing Date';
                ApplicationArea = all;
            }
        }
        addafter("Quantity Invoiced (Base)")
        {
            field("External Lot No."; rec."External Lot No.")
            {
                Editable = FunctionsSupplyVisible;
                Importance = Promoted;
                ApplicationArea = all;

                trigger OnValidate();
                begin
                    rec.TESTFIELD("Lot No.");
                    LotNoInfo.RESET;
                    LotNoInfo.SETRANGE(LotNoInfo."Item No.", rec."Item No.");
                    LotNoInfo.SETRANGE(LotNoInfo."Lot No.", rec."Lot No.");
                    IF LotNoInfo.FINDFIRST THEN
                        LotNoInfo.DELETE;

                    //         IF "External Lot No." <> xRec."External Lot No." THEN
                    //           CreateLotNoInFo;
                end;
            }

        }
    }
    actions
    {

        //Unsupported feature: Change Visible on "FunctionsSupply(Action 50)". Please convert manually.

        modify("Assign Lot No.")
        {
            Promoted = true;
            PromotedCategory = Process;
        }

        //Unsupported feature: PropertyDeletion on ""Line_SerialNoInfoCard"(Action 73)". Please convert manually.

        addafter("Refresh Availability")
        {
            action(Test)
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50002;
                ApplicationArea = all;
            }
        }
    }

    var
        QtyAlreadyHandledToInvoice: Decimal;

        ReservEntry: Record 337;
        ReservEntry2: Record 337;
        RemainingQtyBase: Decimal;
        EntryNo: Integer;

        Text013: TextConst ENU = 'The string %1 contains no number and cannot be incremented.', ENN = 'The string %1 contains no number and cannot be incremented.';
        IsPick: Boolean;
        ExternaLLotNo: Boolean;
        LotNoInfo: Record 6505;
        vExternalLot: Code[20];



    trigger OnOpenPage()
    begin
        vExternalLot := '';  //PCPL/NGL/002
    end;

    trigger OnAfterGetRecord();
    begin

        //PCPL/NGL/002 >>
        vExternalLot := '';
        LotNoInfo.RESET;
        LotNoInfo.SETRANGE(LotNoInfo."Item No.", rec."Item No.");
        LotNoInfo.SETRANGE(LotNoInfo."Lot No.", rec."Lot No.");
        IF LotNoInfo.FINDFIRST THEN
            rec."External Lot No." := LotNoInfo."External Lot No.";
        //PCPL/NGL/002 <<

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        vExternalLot := '';//PCPL/NGL/002
    end;




}

