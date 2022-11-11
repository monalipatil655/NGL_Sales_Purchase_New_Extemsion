page 50109 "Job Maintenance SubPage"
{
    // version PCPL-FA-1.0

    AutoSplitKey = true;
    Caption = 'Job task Item Line';
    PageType = ListPart;
    SourceTable = 50037;
    SourceTableView = WHERE("Component Type" = FILTER(Item | ' '));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Component Type"; rec."Component Type")
                {
                    ApplicationArea = ALL;

                }
                field(Component; rec.Component)
                {
                    ApplicationArea = ALL;

                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = ALL;

                }
                field(Remarks; rec.Remarks)
                {
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = ALL;

                }
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = ALL;

                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = ALL;

                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = ALL;

                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = ALL;

                }
                field("Bin Code"; rec."Bin Code")
                {
                    ApplicationArea = ALL;

                }
                field("Inventory  Qty"; rec."Inventory  Qty")
                {
                    ApplicationArea = ALL;

                }
                field("Quantity Utilized"; rec."Quantity Utilized")
                {
                    ApplicationArea = ALL;

                }
                field("Req no."; rec."Req no.")
                {
                    ApplicationArea = ALL;

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU = '&Line',
                            ENN = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU = 'Item Availability by',
                                ENN = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action(ItemTrackingLines)
                {
                    CaptionML = ENU = 'Item &Tracking Lines',
                                ENN = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    Visible = false;

                    trigger OnAction();
                    begin
                        rec.OpenItemTrackingLines(FALSE);
                        ;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        /*
        vEdit:=TRUE;
        IF MaintenanceHeader.GET("Document No.") THEN
          IF MaintenanceHeader."Maintenance Type"=MaintenanceHeader."Maintenance Type"::"Miscellaneouse Job" THEN
            vEdit:=FALSE;
        */

    end;

    var
        MaintenanceHeader: Record 50035;
        vEdit: Boolean;
}

