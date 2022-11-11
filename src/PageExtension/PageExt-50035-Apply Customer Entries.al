pageextension 50035 Apply_custoer_Entries extends "Apply Customer Entries"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316

    layout
    {



        addfirst(Control1)
        {
            field("Applies-to ID"; rec."Applies-to ID")
            {
                Visible = "Applies-to IDVisible";
                ApplicationArea = all;
            }

        }
    }
    actions
    {



    }

    var
        CalculateCurrency: Boolean;
        HasOppositeEntries: Boolean;
        CurrPosFilter: Text;
        Text004: TextConst ENU = 'You are not allowed to set Applies-to ID while selecting Applies-to Doc. No.', ENN = 'You are not allowed to set Applies-to ID while selecting Applies-to Doc. No.';
        Text006: TextConst ENU = 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post the document of type %1 with the number %2 and then apply it to the document of type %3 with the number %4.', ENN = 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post the document of type %1 with the number %2 and then apply it to the document of type %3 with the number %4.';
        HSNWiseLineRemainingAmount: Decimal;
        "Applies-to IDVisible": Boolean;

    trigger OnOpenPage()
    begin
        "Applies-to IDVisible" := TRUE;
        "Applies-to IDVisible" := ApplnType <> ApplnType::"Applies-to Doc. No.";
    end;




}

