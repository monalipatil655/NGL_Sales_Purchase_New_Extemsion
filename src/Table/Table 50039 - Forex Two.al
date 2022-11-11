table 50039 "Forex Two"
{
    DrillDownPageID = 50067;
    LookupPageID = 50067;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Date of Booking"; Date)
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = ,Sell,Buy;
        }
        field(4; "Currency Code"; Code[10])
        {
        }
        field(5; "Past Performance Balance"; Decimal)
        {
        }
        field(6; Amount; Decimal)
        {

            trigger OnValidate();
            begin
                //pcpl0024_26FEB2019
                IF Amount > "Past Performance Balance" THEN
                    ERROR('Amount is Grreater then Remaining Amount')
                ELSE BEGIN
                    "Remaining Performance Balance" := "Past Performance Balance" - Amount;
                    "Remaining Amount" := Amount;
                END;
                //pcpl0024_26FEB2019
            end;
        }
        field(7; "Maturity  Date"; Date)
        {
        }
        field(8; "Fwd Exchage Rate"; Decimal)
        {
        }
        field(9; "Spot Rate at time of booking"; Decimal)
        {
        }
        field(10; Premium; Decimal)
        {
        }
        field(11; "Utilisation Date"; Date)
        {
        }
        field(12; "Utilized in export"; Decimal)
        {
        }
        field(13; "Pre-utilization rate"; Decimal)
        {
        }
        field(14; "Pre-util.Charges(pro-rata)"; Decimal)
        {
        }
        field(15; "Spot rate at the time of util."; Decimal)
        {
        }
        field(16; "Profit/Loss"; Decimal)
        {
        }
        field(17; "Forward No."; Text[50])
        {

            trigger OnValidate();
            begin
                //pcpl0024_26Feb2019
                OldEntry := "Entry No." - 1;
                recForexTwo.RESET;
                recForexTwo.SETRANGE(recForexTwo."Entry No.", OldEntry);
                IF recForexTwo.FINDFIRST THEN
                    "Past Performance Balance" := recForexTwo."Remaining Performance Balance";
                //pcpl0024_26feb2019
            end;
        }
        field(18; "Remaining Performance Balance"; Decimal)
        {
            Description = 'PCPL0024_26Feb2019';
        }
        field(19; "Remaining Amount"; Decimal)
        {
            Description = 'PCPL0024_26Feb2019';
        }
        field(20; "Document No."; Code[20])
        {
            Description = 'PCPL0024';
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Forward No.")
        {
        }
        key(Key2; "Remaining Amount")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Forward No.", "Remaining Amount")
        {
        }
    }

    var
        OldEntry: Integer;
        recForexTwo: Record 50039;
}

