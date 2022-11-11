pageextension 50000 Company_info extends "Company Information"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM

    layout
    {

        addbefore(Picture)
        {
            field("Insurance Policy No"; rec."Insurance Policy No")
            {
                ApplicationArea = all;
            }

            field("IEC CODE No."; rec."IEC CODE No.")
            {
            }
            field("Indent Closing Period"; rec."Indent Closing Period")
            {
            }
        }
        addafter("GST Registration No.")
        {
            field("END Use Code"; rec."END Use Code")
            {
                ApplicationArea = all;
            }
        }
    }

}





