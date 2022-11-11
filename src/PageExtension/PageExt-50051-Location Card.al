pageextension 50051 Location_card extends "Location Card"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,PCPL/QC/V3/001

    layout
    {

        addafter(Name)
        {
            field("Name 2"; rec."Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter("State Code")
        {

            field("Label Format No."; rec."Label Format No.")
            {
                ApplicationArea = all;
            }
        }


        addafter("Composition Type")
        {

            field("Drug license No."; rec."Drug license No.")
            {
                ApplicationArea = all;
            }

        }
    }


    //Unsupported feature: CodeModification on "UpdateEnabled(PROCEDURE 1)". Please convert manually.

    //procedure UpdateEnabled();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Require PickEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
    "Require Put-awayEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
    "Require ReceiveEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
    #4..32
    AssemblyShipmentBinCodeEnable := "Bin Mandatory" AND NOT ShipmentBinCodeEnable;
    "Default Bin SelectionEnable" := "Bin Mandatory" AND NOT "Directed Put-away and Pick";
    "Use ADCSEnable" := NOT "Use As In-Transit" AND "Directed Put-away and Pick";
    "Pick According to FEFOEnable" := "Require Pick" AND "Bin Mandatory";
    "Composition TypeEnable" := Composition;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..35
    "Pick According to FEFOEnable" := "Require Pick";
    "Pick According to FEFOEnable" := "Require Pick";
    "Composition TypeEnable" := Composition;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

