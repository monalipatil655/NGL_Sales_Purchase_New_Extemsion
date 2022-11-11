codeunit 50018 "BOM Updation"
{

    trigger OnRun();
    begin
        recBOMUp.RESET;
        IF recBOMUp.FINDSET THEN
            REPEAT
                BOM.GET(recBOMUp.Code);
                BOM."Location Code" := recBOMUp.Location;
                BOM.MODIFY(TRUE);
            UNTIL recBOMUp.NEXT = 0;
        MESSAGE('done');
    end;

    var
        BOM: Record 99000771;
        recBOMUp: Record 50007;
}

