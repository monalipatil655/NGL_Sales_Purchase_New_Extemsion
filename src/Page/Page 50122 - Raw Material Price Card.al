page 50122 "Raw Material Price Card"
{
    // version //PCPL AntiCost

    PageType = Document;
    SourceTable = 50050;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = vEdit;
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field("No. Series"; rec."No. Series")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Item Category Code"; rec."Item Category Code")
                {
                    ApplicationArea = all;
                }
                field("Created By"; rec."Created By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = all;
                }
            }
            part(Part01; 50123)
            {
                Editable = vEdit;
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Release)
            {

                trigger OnAction();
                begin
                    IF rec.Status = rec.Status::Open THEN BEGIN
                        rec.Status := rec.Status::Released;
                        IF rec."Posting Date" <> 0D THEN
                            rec."Posting Date" := TODAY;
                    END ELSE
                        rec.TESTFIELD(Status, Status::Open);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        vEdit := TRUE;
        IF rec.Status = rec.Status::Released THEN
            vEdit := FALSE
        ELSE
            vEdit := TRUE;
    end;

    trigger OnOpenPage();
    begin
        vEdit := TRUE;
        IF rec.Status = rec.Status::Released THEN
            vEdit := FALSE
        ELSE
            vEdit := TRUE;
    end;

    var
        vEdit: Boolean;
}

