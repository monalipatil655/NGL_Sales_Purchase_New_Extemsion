page 50063 "Manufacturer Details"
{
    Caption = 'Manufacturer Details';
    PageType = List;
    SourceTable = 50029;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Brand Type"; rec."Brand Type")
                {
                    Caption = 'Item Code';
                    TableRelation = Item;
                    ApplicationArea = all;
                }
                field("Brand Name"; rec."Brand Name")
                {
                    Caption = 'Manufacturer Name';
                    ApplicationArea = all;
                }
                field(Location; rec.Location)
                {
                    TableRelation = Location;
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

