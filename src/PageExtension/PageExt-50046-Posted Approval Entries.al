pageextension 50046 Posted_Approval_entries extends "Posted Approval Entries"
{
    // version NAVW19.00.00.45778

    procedure Setfilters(TableId: Integer; DocumentNo: Code[20]);
    begin
        IF TableId <> 0 THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETRANGE("Table ID", TableId);
            IF DocumentNo <> '' THEN
                rec.SETRANGE("Document No.", DocumentNo);
            rec.FILTERGROUP(0);
        END;
    end;
}

