table 50044 "Processing Charges"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"From Date";Date)
        {
        }
        field(3;"To Date";Date)
        {
        }
        field(4;"Location Code";Code[10])
        {
            TableRelation = Location;
        }
        field(5;"Vendor No";Code[20])
        {
            TableRelation = Vendor;
        }
        field(6;"Item No";Code[20])
        {
            TableRelation = Item;
        }
        field(7;"Rate (INR)";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

