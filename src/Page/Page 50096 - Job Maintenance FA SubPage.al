page 50096 "Job Maintenance FA SubPage"
{
    // version PCPL-FA-1.0

    AutoSplitKey = true;
    Caption = 'Job task FA Line';
    PageType = ListPart;
    SourceTable = 50037;
    SourceTableView = WHERE("Component Type" = FILTER(FA));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Component Type"; rec."Component Type")
                {
                    ApplicationArea = all;
                }
                field(Component; rec.Component)
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
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
}

