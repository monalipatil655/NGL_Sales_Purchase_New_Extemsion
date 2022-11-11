tableextension 50024 Sales_Line extends "Sales Line"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS160375,TFS167310,TFS180484,//PCPLTDS194Q,PCPL-25/proofExp

    fields
    {


        modify(Exempted)
        {
            CaptionML = ENU = 'Exempted';
        }

        field(50000; "Mark and Containger No"; Text[30])
        {
            Description = 'Sanjay 26/03/2015';
        }
        field(50001; "Lost Quote Status"; Boolean)
        {
            Description = '//PCPL 38';
        }
        field(50106; "Proof of Export"; Boolean)
        {
            Description = 'PCPL-25';
        }
        field(50107; "IGST Taxable Value (INR-SB)"; Decimal)
        {
            Description = 'PCPL50';
        }
        field(50108; "Inv - Value (INR-SB)"; Decimal)
        {
            Description = 'PCPL50';
        }
    }

    var
        ItemRec: Record 27;
        ReserEntry: Record 337;
        Qty: Decimal;
        Qty2: Decimal;
        RefEntryNo: Integer;
        CurrencyFactor: Decimal;
        FixedAmt: Decimal;
        VariableAmt: Decimal;
        AdjustedAmt: Decimal;
        DiffAdjustmentAmt: Decimal;
        "--- GITLExim-------": Integer;
        reccurrexchraatea: Record 330;

        Text16509: Label 'Quantity should be in multiple of Unit Per Parcel for Item No. %1';
        recCLE: Record 21;
        SH: Record 36;
        Reccustomer: Record 18;
}

