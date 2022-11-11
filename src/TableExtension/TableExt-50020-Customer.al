tableextension 50020 Customer_ext extends Customer
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,TFS338699,TFS180484,//PCPLTDS194Q

    fields
    {


        modify("GST Customer Type")
        {
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted', ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted';

            //Unsupported feature: Change OptionString on ""GST Customer Type"(Field 16610)". Please convert manually.

        }
        modify("e-Commerce Operator")
        {
            CaptionML = ENU = 'e-Commerce Operator';
        }


        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            begin

                IF ("Country/Region Code" <> xRec."Country/Region Code") AND (xRec."Country/Region Code" <> '') THEN
                    PostCode.ClearFields(City, "Post Code", County);

            end;

        }
        field(50000; "Drug Lic. No. 1"; Code[35])
        {
            Description = 'CHANGE FROM 20 TO 35 SANJAY 03/08/2016';
        }
        field(50001; "Balance Approval Mail"; Boolean)
        {
            Description = 'PCPL 38';
        }
        field(50101; "Drug Lic. No. 2"; Code[35])
        {
            Description = 'CHANGE FROM 20 TO 35 SANJAY 03/08/2016';
        }
        field(50102; "Drug Lic. No. 3"; Code[35])
        {
            Description = 'CHANGE FROM 20 TO 35 SANJAY 03/08/2016';
        }
        field(50103; "TCS Applicable"; Boolean)
        {
            Description = 'PCPL0017';

            trigger OnValidate();
            begin
                //PCPLTDS194Q
                IF "TDS 194Q Declaration" THEN
                    ERROR('TDS 194Q declaration must be false to ACTIVATE TCS Applicable');
                //PCPLTDS194Q
            end;
        }

        field(50105; "Incoming Document Entry No."; Integer)
        {
            Description = 'PCPLTDS194Q';
        }
        field(50106; "TDS 194Q Declaration"; Boolean)
        {
            Description = 'PCPLTDS194Q';

            trigger OnValidate();
            begin
                //PCPLTDS194Q
                IF "TCS Applicable" THEN
                    ERROR('TCS Applicable  must be false to ACTIVATE TDS 194Q declaration');
                //PCPLTDS194Q
            end;
        }
        field(33000990; "Free Trade Zone"; Boolean)
        {
            Description = 'GITLExim';
        }
    }




    var
        NoSeriesCode: Code[10];
        PostCode: Record 225;
}

