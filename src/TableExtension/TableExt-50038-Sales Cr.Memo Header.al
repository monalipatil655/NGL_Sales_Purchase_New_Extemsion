tableextension 50038 Sales_Cr_Memo_Hed_Ext extends "Sales Cr.Memo Header"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,TFS180484

    fields
    {


        modify("GST Customer Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted', ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted';

            //Unsupported feature: Change OptionString on ""GST Customer Type"(Field 16602)". Please convert manually.

        }
        modify("Invoice Type")
        {
            OptionCaptionML = ENU = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST', ENN = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST';

            //Unsupported feature: Change OptionString on ""Invoice Type"(Field 16605)". Please convert manually.

        }


        field(99008500; "Date Received"; Date)
        {
            Caption = 'Date Received';
        }
        field(99008501; "Time Received"; Time)
        {
            Caption = 'Time Received';
        }
        field(99008509; "Date Sent"; Date)
        {
            Caption = 'Date Sent';
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }
    }




    var
        DimMgt: Codeunit 408;
        PostSalesLinesDelete: Codeunit 363;
}

