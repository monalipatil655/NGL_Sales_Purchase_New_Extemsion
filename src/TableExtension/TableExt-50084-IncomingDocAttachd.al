tableextension 50084 Incoming_Doc_attached extends "Incoming Document Attachment"
{
    fields
    {
        field(50000; "File Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;


    procedure NewAttachmentFromVendorDocument1(Vendor: Record Vendor)
    begin
        //PCPLTDS194Q
        NewAttachmentFromDocument(
          Vendor."Incoming Document Entry No.",
          DATABASE::Vendor,
          6,
          Vendor."No.");
    end;
    //PCPLTDS194Q

    procedure NewAttachmentFromCustomerDocument(Customer: Record Customer)
    begin
        //PCPLTDS194Q
        NewAttachmentFromDocument(
          Customer."Incoming Document Entry No.",
          DATABASE::Customer,
          7,
          Customer."No.");
        //PCPLTDS194Q
    end;

    procedure NewAttachmentFromVendorDocument(Vendor: Record Vendor)
    begin
        //PCPLTDS194Q
        NewAttachmentFromDocument(
          Vendor."Incoming Document Entry No.",
          DATABASE::Vendor,
          6,
          Vendor."No.");
    end;
    //PCPLTDS194Q
    procedure NewAttachmentFromFinishedProduction(ProductionOrder: Record "Production Order")
    begin
        //PCPL/FinishedProd/INCDoc
        NewAttachmentFromDocument(
  ProductionOrder."Incoming Document Entry No.",
  DATABASE::"Production Order",
  7,
  ProductionOrder."No.");
    end;
    //PCPL/FinishedProd/INCDoc



}