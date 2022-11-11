tableextension 50027 Gen_journal_line_ext extends "Gen. Journal Line"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484\\pcpl0024_FILE GEN,//PCPLTDS194Q

    fields
    {



        modify("Shift Type")
        {
            CaptionML = ENU = 'Shift Type';
            OptionCaptionML = ENU = 'Single,Double,Triple';
        }
        modify("Industry Type")
        {
            CaptionML = ENU = 'Industry Type';
            OptionCaptionML = ENU = 'Normal,Non Seasonal,Seasonal';
        }
        modify("No. of Days for Shift")
        {
            CaptionML = ENU = 'No. of Days for Shift';
        }

        modify("Offline Application")
        {
            CaptionML = ENU = 'Offline Application';
        }

        field(50002; "Type of payment"; Option)
        {
            Description = 'pcpl0024_FILE GEN';
            OptionCaption = '" ,RTGS,NEFT"';
            OptionMembers = " ",RTGS,NEFT;
        }
        field(50004; "Bill of entry no"; Code[10])
        {
        }
        // field(50005; "Bill of entry date"; Date)  //PCPL/NSW/MIG 21 July 22
        // {
        // }
        field(50006; "Transfer to location"; Code[30])
        {
            TableRelation = Location.Code;
        }
        field(50007; "Payment Type"; Option)
        {
            Description = 'PCPLTDS194Q';
            OptionCaption = '" ,Normal,Advance"';
            OptionMembers = " ",Normal,Advance;
        }

    }


    var
        CompanyInfo: Record 79;
        CustLedgerEntry: Record 21;
        // STReverseChargeSetup: Record 16461;
        // TDSGroup: Record 13731;
        CalculatedTDSAmt: Decimal;
        CalculatedSurchargeAmt: Decimal;
        SurchargeBase: Decimal;
        WorkTaxBaseAmt: Decimal;
        TCSEntry: Record "TCS Entry";
        CustLedgEntry: Record 21;
        DateFilterCalc: Codeunit 358;

        Location: Record 14;
        ReplaceInfo: Boolean;
        recVend: Record 23;
        recVLE: Record 25;
}

