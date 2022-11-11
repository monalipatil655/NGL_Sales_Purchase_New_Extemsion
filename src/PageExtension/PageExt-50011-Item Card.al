pageextension 50011 Item_card extends "Item Card"
{


    layout
    {



        addafter(Description)
        {
            field("Description 2"; rec."Description 2")
            {
                ApplicationArea = all;
            }
        }
        addafter(Exempted)
        {
            field("Inventory Value Zero"; rec."Inventory Value Zero")
            {
                ApplicationArea = all;
            }

            field("Tolerance %"; rec."Tolerance %")
            {
                ApplicationArea = all;
            }

            field("Import Duty Group"; rec."Import Duty Group")
            {
                Visible = false;
            }
        }
        addafter(Subcontracting)
        {
            group(Quality)
            {
                Caption = 'Quality';
                field("Packing Type"; rec."Packing Type")
                {
                    ApplicationArea = all;
                }
                field("Packing Size"; rec."Packing Size")
                {
                    ApplicationArea = all;
                }
                field("Reg. No."; rec."Reg. No.")
                {
                    ApplicationArea = all;
                }
                field("Reg. Expiry"; rec."Reg. Expiry")
                {
                    ApplicationArea = all;
                }
                field("RC Status"; rec."RC Status")
                {
                    ApplicationArea = all;
                }
                field("Blocked Type"; rec."Blocked Type")
                {
                    ApplicationArea = all;
                }
                field("HS Code"; rec."HS Code")
                {
                    ApplicationArea = all;
                }
                field(Density; rec.Density)
                {
                    ApplicationArea = all;
                }
                field("Product Code"; rec."Product Code")
                {
                    ApplicationArea = all;
                }
                field("Inspection Sample Quantity"; rec."Inspection Sample Quantity")
                {
                    ApplicationArea = all;
                }
                field("Retesting Frequency Required"; rec."Retesting Frequency Required")
                {
                    ApplicationArea = all;
                }
                field(Synonym; rec.Synonym)
                {
                    ApplicationArea = all;
                }
                field("CAS No."; rec."CAS No.")
                {
                    ApplicationArea = all;
                }
                field("Mol. Formula"; rec."Mol. Formula")
                {
                    ApplicationArea = all;
                }
                field("Mol. Weight"; rec."Mol. Weight")
                {
                    ApplicationArea = all;
                }
                field("Mol. Structure"; rec."Mol. Structure")
                {
                    ApplicationArea = all;
                }
                field("Rejected Inventory"; rec."Rejected Inventory")
                {
                    ApplicationArea = all;
                }
                field("Accepted Inventory"; rec."Accepted Inventory")
                {
                    ApplicationArea = all;
                }
                field("Quarantine Inventory"; rec."Quarantine Inventory")
                {
                    ApplicationArea = all;
                }
                field("Specs ID"; rec."Specs ID")
                {
                    ApplicationArea = all;
                }
                field("Retest Duration"; rec."Retest Duration")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {


        addafter("Ven&dors")
        {
            action("Vendor Catalog")
            {
                CaptionML = ENU = 'Vendor Catalog',
                            ENN = 'Ven&dors';
                Image = Vendor;
                RunObject = Page 50066;
                RunPageLink = "Item No." = FIELD("No.");
                RunPageView = SORTING("Item No.");
                ApplicationArea = all;
            }
        }
    }



}

