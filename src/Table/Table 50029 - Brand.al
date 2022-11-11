table 50029 Brand
{
    DrillDownPageID = 50063;
    LookupPageID = 50063;

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Brand Type";Code[20])
        {
            Caption = 'Vendor No';
        }
        field(3;"Brand Name";Text[30])
        {
            Caption = 'Manufacturer Name';
        }
        field(4;Location;Code[60])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No","Brand Type","Brand Name")
        {
        }
    }

    fieldgroups
    {
    }
}

