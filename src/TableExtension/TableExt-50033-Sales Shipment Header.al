tableextension 50033 Sales_Ship_header extends "Sales Shipment Header"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM,TFS180484

    fields
    {
        field(99008500; "Date Received"; Date)
        {
            Caption = 'Date Received';
        }
        field(99008501; "Time Received"; Time)
        {
            Caption = 'Time Received';
        }
        field(99008509; "Date Sent"; Date)
        {
            Caption = 'Date Sent';
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

