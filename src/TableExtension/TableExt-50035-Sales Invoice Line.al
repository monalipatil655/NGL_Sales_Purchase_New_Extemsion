tableextension 50035 tableextension50023 extends "Sales Invoice Line"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS180484,PCPL-25/proofExp

    fields
    {


        modify("Invoice Type")
        {
            OptionCaptionML = ENU = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST', ENN = 'Taxable,Bill of Supply,Export,Supplementary,Debit Note,Non-GST';

            //Unsupported feature: Change OptionString on ""Invoice Type"(Field 16609)". Please convert manually.

        }
        modify(Exempted)
        {
            CaptionML = ENU = 'Exempted';
        }

        //Unsupported feature: Deletion on ""Purchase Order No."(Field 71)". Please convert manually.


        //Unsupported feature: Deletion on ""Purch. Order Line No."(Field 72)". Please convert manually.

        field(50016; "Type of Packing"; Text[30])
        {
            Description = 'AMK';
        }
        field(50105; "Adv. Lic. File No."; Code[20])
        {
            Description = 'RSPL/EXIM 3.00.1';
            // TableRelation = IF (Type = FILTER(Item),
            //                   "No." = FILTER(<> '')) "Advance License Header"."No." WHERE(Status = FILTER(Active));//PCPL/NSW/MIG 21July22 Exim Part Remove

            trigger OnValidate();
            var
                lrecSalesHeader: Record 36;
                // lcduEximSalesMgmt: Codeunit 33000997;
                lMS33000990: Label 'Advance License should be Blank if Export order is applied for Incentive type DDB/DEPB/DFRC';
            begin

                /*
               IF lrecSalesHeader.GET("Document Type","Document No.") THEN
                 lrecSalesHeader.TESTFIELD("Export Document",TRUE);

               IF ((Type = Type::Item) AND ("Adv. Lic. File No." <> xRec."Adv. Lic. File No.") AND ("Adv. Lic. File No." <> '')) THEN
                 lcduEximSalesMgmt.fctCheckAdvanceLicense(Rec);

               //DCS-RGP-24.11.11-NS
               AdvanceLic_gRec.RESET;
               AdvanceLic_gRec.SETRANGE(AdvanceLic_gRec."No.","Adv. Lic. File No.");
               IF AdvanceLic_gRec.FINDFIRST THEN BEGIN

               END;
               //DCS-RGP-24.11.11-NE

               //ROBOSOFT-V001---Start
               IF ("Incentive Type" <> "Incentive Type"::" ") THEN
                  ERROR(lMS33000990);
               //ROBOSOFT-V001---Start
                 */

            end;
        }
        field(50106; "Proof of Export"; Boolean)
        {
            Description = 'PCPL-25';
        }
        field(50200; "GST Base Amt."; Decimal)
        {
            CalcFormula = - Average("Detailed GST Ledger Entry"."GST Base Amount" WHERE("Document No." = FIELD("Document No."),
                                                                                        "Document Line No." = FIELD("Line No."),
                                                                                        "No." = FIELD("No.")));
            Description = 'PCPL0017';
            FieldClass = FlowField;
        }
        field(80004; "Mark No."; Text[50])
        {
            Description = 'samit db data sanjay';
        }

    }
    keys
    {
        key(Key11; "No.")
        {
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

