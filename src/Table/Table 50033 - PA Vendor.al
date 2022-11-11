table 50033 "PA Vendor"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,TFS180484

    CaptionML = ENU = 'Vendor',
                ENN = 'Vendor';
    DataCaptionFields = "No.", Name;
    DrillDownPageID = 27;
    LookupPageID = 27;
    Permissions = TableData 25 = r;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.',
                        ENN = 'No.';
        }
        field(2; Name; Text[50])
        {
            CaptionML = ENU = 'Name',
                        ENN = 'Name';
        }
        field(3; "Indent Doc No"; Code[30])
        {
            Description = '//38 PCPL';
        }
        field(4; Selected; Boolean)
        {
            Description = '//38 PCPL';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name/*,Field7,Field91,Field9,Field8*/) //PCPL/NSW/MIG 08Jule22
        {
        }
        fieldgroup(Brick; "No.", Name/*,Field59,Field8,Field67*/) //PCPL/NSW/MIG 08Jule22
        {
        }
    }

    trigger OnDelete();
    var
        ItemVendor: Record 99;
        PurchPrice: Record 7012;
        PurchLineDiscount: Record 7014;
        PurchPrepmtPct: Record 460;
        //SocialListeningSearchTopic: Record 871;
        CustomReportSelection: Record 9657;
        VATRegistrationLogMgt: Codeunit 249;
    begin
    end;

    trigger OnInsert();
    var
        NoSeriesCode: Code[10];
    begin
    end;
}

