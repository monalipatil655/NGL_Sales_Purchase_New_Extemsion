pageextension 50050 Fixed_Asset_Card extends "Fixed Asset Card"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,//PCPL-FA

    layout
    {

        addafter(Description)
        {
            field("Description 2"; rec."Description 2")
            {
                ApplicationArea = all;
            }
            field("Salvage Value Applicable"; rec."Salvage Value Applicable")
            {
                ApplicationArea = all;
            }
        }


    }
    actions
    {

        addafter("Main&tenance Ledger Entries")
        {
            action("Job Component List")
            {
                CaptionML = ENU = 'Job Component List',
                            ENN = 'Ledger E&ntries';
                Image = FixedAssetLedger;
                Promoted = false;
                ApplicationArea = all;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 50111;
                RunPageLink = "FA No." = FIELD("No.");
                ShortCutKey = 'Ctrl+F7';
            }
            action("Closed Job Maintenace List")
            {
                Caption = 'Closed Job Maintenace List';
                RunObject = Page 50110;
                RunPageLink = "FA No." = FIELD("No.");
                ApplicationArea = all;

            }
            action("Job Maintenace List")
            {
                Caption = 'Job Maintenace List';
                RunObject = Page 50097;
                RunPageLink = "FA No." = FIELD("No.");
                ApplicationArea = all;
            }
        }
        addafter(Register)
        {
            action("CRETAE FA Ledger Entry")
            {
                ApplicationArea = all;

                trigger OnAction();
                begin
                    //PCPL-FA
                    CLEAR(amt);
                    IF rec."Salvage Value Applicable" THEN BEGIN
                        FASetup.GET;
                        FASetup.TESTFIELD("Salvage Value %");
                        FALedgerEntry.RESET;
                        IF FALedgerEntry.FINDLAST THEN
                            cnt := FALedgerEntry."Entry No." + 1;
                        FADepreciationBook.RESET;
                        FADepreciationBook.SETRANGE("FA No.", rec."No.");
                        IF FADepreciationBook.FINDFIRST THEN BEGIN
                            FADepreciationBook.CALCFIELDS("Salvage Value");
                            IF FADepreciationBook."Salvage Value" <> 0 THEN
                                EXIT;
                            FALedEn.RESET;
                            FALedEn.SETRANGE(FALedEn."FA No.", rec."No.");
                            FALedEn.SETFILTER("Document Type", '%1|%2', FALedEn."Document Type"::Invoice, FALedEn."Document Type"::" ");
                            FALedEn.SETRANGE("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                            FALedEn.SETRANGE("FA Posting Type", FALedEn."FA Posting Type"::"Acquisition Cost");
                            IF FALedEn.FINDFIRST THEN BEGIN
                                amt := (FALedEn.Amount * FASetup."Salvage Value %") / 100;
                            END;
                            FALedgerEntry.INIT;
                            FALedgerEntry."Entry No." := cnt;
                            FALedgerEntry.VALIDATE("FA No.", rec."No.");
                            FALedgerEntry.VALIDATE("Posting Date", WORKDATE);
                            FALedgerEntry.VALIDATE("Document Date", WORKDATE);
                            FALedgerEntry.VALIDATE("FA Posting Date", WORKDATE);
                            FALedgerEntry.VALIDATE(Description, FADepreciationBook.Description);
                            FALedgerEntry.VALIDATE("Depreciation Method", FADepreciationBook."Depreciation Method");
                            FALedgerEntry.VALIDATE("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                            FALedgerEntry.VALIDATE("Part of Book Value", TRUE);
                            FALedgerEntry.VALIDATE(Amount, -amt);
                            FALedgerEntry.VALIDATE("FA Posting Type", FALedgerEntry."FA Posting Type"::"Salvage Value");
                            FALedgerEntry.VALIDATE("Part of Book Value", FALSE);
                            FALedgerEntry.VALIDATE("Part of Depreciable Basis", TRUE);
                            FALedgerEntry.INSERT;
                        END;
                    END;
                    //PCPL-FA
                end;
            }
        }
    }

    var

        FALedgerEntry: Record 5601;
        FADepreciationBook: Record 5612;
        FASetup: Record 5603;
        FA: Record 5600;
        DepreciationBook: Record 5611;
        cnt: Integer;
        amt: Decimal;
        FALedEn: Record 5601;

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

