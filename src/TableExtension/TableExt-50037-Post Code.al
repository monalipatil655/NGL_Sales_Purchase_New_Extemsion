tableextension 50037 Post_code extends "Post Code"
{
    fields
    {
        // Add changes to table fields here
    }

    var
        myInt: Integer;


    Procedure ClearFields(VAR City: Text[30]; VAR PostCode: Code[20]; VAR County: Text[30])
    begin
        City := '';
        PostCode := '';
        County := '';
    end;

    Procedure LookUpCity(VAR City: Text[30]; VAR PostCode: Code[20]; ReturnValues: Boolean)
    var
        PostCodeRec: Record "Post Code";
    begin
        IF NOT GUIALLOWED THEN
            EXIT;
        PostCodeRec.SETCURRENTKEY(City, Code);
        PostCodeRec.Code := PostCode;
        PostCodeRec.City := City;
        IF (PAGE.RUNMODAL(PAGE::"Post Codes", PostCodeRec, PostCodeRec.City) = ACTION::LookupOK) AND ReturnValues THEN BEGIN
            PostCode := PostCodeRec.Code;
            City := PostCodeRec.City;
        END;
    end;

    Procedure LookUpPostCode(VAR City: Text[30]; VAR PostCode: Code[20]; ReturnValues: Boolean)
    var
        PostCodeRec: Record "Post Code";
    begin
        IF NOT GUIALLOWED THEN
            EXIT;
        PostCodeRec.SETCURRENTKEY(Code, City);
        PostCodeRec.Code := PostCode;
        PostCodeRec.City := City;
        IF (PAGE.RUNMODAL(PAGE::"Post Codes", PostCodeRec, PostCodeRec.Code) = ACTION::LookupOK) AND ReturnValues THEN BEGIN
            PostCode := PostCodeRec.Code;
            City := PostCodeRec.City;
        END;
    end;
}