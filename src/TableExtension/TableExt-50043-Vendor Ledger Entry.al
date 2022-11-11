tableextension 50043 Vend_led_Entry_ext extends "Vendor Ledger Entry"
{
    fields
    {


        field(50000; Narration; Text[100])
        {
        }

        field(50002; "Payment Terms Code"; Code[10])
        {
            Description = 'PCPL50 10/11/21';
        }
        field(33000990; "Import Document"; Boolean)
        {
        }
    }




    var
        Location: Record 14;
        Vendor: Record 23;


    //Unsupported feature: PropertyModification on "FieldIsNotEmptyErr(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FieldIsNotEmptyErr : @@@="%1=Field;%2=Field";ENU=%1 cannot be used while %2 has a value.;ENN=%1 cannot be used while %2 has a value.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FieldIsNotEmptyErr : @@@="%1=Field;%2=Field";ENU=%1 cannot be used while %2 has a value.;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MustHaveSameSignErr(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MustHaveSameSignErr : ENU=must have the same sign as %1;ENN=must have the same sign as %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustHaveSameSignErr : ENU=must have the same sign as %1;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MustNotBeLargerErr(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MustNotBeLargerErr : ENU=must not be larger than %1;ENN=must not be larger than %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustNotBeLargerErr : ENU=must not be larger than %1;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Text16500(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Text16500 : ENU=You must specify the same TDS on both applying documents.;ENN=You must specify the same TDS on both applying documents.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16500 : ENU=You must specify the same TDS on both applying documents.;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Text16501(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Text16501 : ENU=You must specify the same Work Tax on both applying documents.;ENN=You must specify the same Work Tax on both applying documents.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text16501 : ENU=You must specify the same Work Tax on both applying documents.;
    //Variable type has not been exported.
}

