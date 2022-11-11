page 50119 "FA Depreciation book modify"
{
    PageType = List;
    Permissions = TableData 5612 = rimd;
    SourceTable = 5612;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("FA No."; rec."FA No.")
                {
                    ApplicationArea = all;

                }
                field("Depreciation Book Code"; rec."Depreciation Book Code")
                {
                    ApplicationArea = all;
                }
                field("Depreciation Method"; rec."Depreciation Method")
                {
                    ApplicationArea = all;
                }
                field("Depreciation Starting Date"; rec."Depreciation Starting Date")
                {
                    ApplicationArea = all;
                }
                field("Straight-Line %"; rec."Straight-Line %")
                {
                    ApplicationArea = all;
                }
                field("No. of Depreciation Years"; rec."No. of Depreciation Years")
                {
                    ApplicationArea = all;
                }
                field("No. of Depreciation Months"; rec."No. of Depreciation Months")
                {
                    ApplicationArea = all;
                }
                field("Fixed Depr. Amount"; rec."Fixed Depr. Amount")
                {
                    ApplicationArea = all;
                }
                field("Declining-Balance %"; rec."Declining-Balance %")
                {
                    ApplicationArea = all;
                }
                field("Depreciation Table Code"; rec."Depreciation Table Code")
                {
                    ApplicationArea = all;
                }
                field("Final Rounding Amount"; rec."Final Rounding Amount")
                {
                    ApplicationArea = all;
                }
                field("Ending Book Value"; rec."Ending Book Value")
                {
                    ApplicationArea = all;
                }
                field("FA Posting Group"; rec."FA Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Depreciation Ending Date"; rec."Depreciation Ending Date")
                {
                    ApplicationArea = all;
                }
                field("Acquisition Cost"; rec."Acquisition Cost")
                {
                    ApplicationArea = all;
                }
                field(Depreciation; rec.Depreciation)
                {
                    ApplicationArea = all;
                }
                field("Book Value"; rec."Book Value")
                {
                    ApplicationArea = all;
                }
                field("Proceeds on Disposal"; rec."Proceeds on Disposal")
                {
                    ApplicationArea = all;
                }
                field("Gain/Loss"; rec."Gain/Loss")
                {
                    ApplicationArea = all;
                }
                field("Write-Down"; rec."Write-Down")
                {
                    ApplicationArea = all;
                }
                field(Appreciation; rec.Appreciation)
                {
                    ApplicationArea = all;
                }
                field("Custom 1"; rec."Custom 1")
                {
                    ApplicationArea = all;
                }
                field("Custom 2"; rec."Custom 2")
                {
                    ApplicationArea = all;
                }
                field("Depreciable Basis"; rec."Depreciable Basis")
                {
                    ApplicationArea = all;
                }
                field("Salvage Value"; rec."Salvage Value")
                {
                    ApplicationArea = all;
                }
                field("Book Value on Disposal"; rec."Book Value on Disposal")
                {
                    ApplicationArea = all;
                }
                field(Maintenance; rec.Maintenance)
                {
                    ApplicationArea = all;
                }
                field("Maintenance Code Filter"; rec."Maintenance Code Filter")
                {
                    ApplicationArea = all;
                }
                field("FA Posting Date Filter"; rec."FA Posting Date Filter")
                {
                    ApplicationArea = all;
                }
                field("Acquisition Date"; rec."Acquisition Date")
                {
                    ApplicationArea = all;
                }
                field("G/L Acquisition Date"; rec."G/L Acquisition Date")
                {
                    ApplicationArea = all;
                }
                field("Disposal Date"; rec."Disposal Date")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Last Acquisition Cost Date"; rec."Last Acquisition Cost Date")
                {
                    ApplicationArea = all;
                }
                field("Last Depreciation Date"; rec."Last Depreciation Date")
                {
                    ApplicationArea = all;
                }
                field("Last Write-Down Date"; rec."Last Write-Down Date")
                {
                    ApplicationArea = all;
                }
                field("Last Appreciation Date"; rec."Last Appreciation Date")
                {
                    ApplicationArea = all;
                }
                field("Last Custom 1 Date"; rec."Last Custom 1 Date")
                {
                    ApplicationArea = all;
                }
                field("Last Custom 2 Date"; rec."Last Custom 2 Date")
                {
                    ApplicationArea = all;
                }
                field("Last Salvage Value Date"; rec."Last Salvage Value Date")
                {
                    ApplicationArea = all;
                }
                field("FA Exchange Rate"; rec."FA Exchange Rate")
                {
                    ApplicationArea = all;
                }
                field("Fixed Depr. Amount below Zero"; rec."Fixed Depr. Amount below Zero")
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("First User-Defined Depr. Date"; rec."First User-Defined Depr. Date")
                {
                    ApplicationArea = all;
                }
                field("Use FA Ledger Check"; rec."Use FA Ledger Check")
                {
                    ApplicationArea = all;
                }
                field("Last Maintenance Date"; rec."Last Maintenance Date")
                {
                    ApplicationArea = all;
                }
                field("Depr. below Zero %"; rec."Depr. below Zero %")
                {
                    ApplicationArea = all;
                }
                field("Projected Disposal Date"; rec."Projected Disposal Date")
                {
                    ApplicationArea = all;
                }
                field("Projected Proceeds on Disposal"; rec."Projected Proceeds on Disposal")
                {
                    ApplicationArea = all;
                }
                field("Depr. Starting Date (Custom 1)"; rec."Depr. Starting Date (Custom 1)")
                {
                    ApplicationArea = all;
                }
                field("Depr. Ending Date (Custom 1)"; rec."Depr. Ending Date (Custom 1)")
                {
                    ApplicationArea = all;
                }
                field("Accum. Depr. % (Custom 1)"; rec."Accum. Depr. % (Custom 1)")
                {
                    ApplicationArea = all;
                }
                field("Depr. This Year % (Custom 1)"; rec."Depr. This Year % (Custom 1)")
                {
                    ApplicationArea = all;
                }
                field("Property Class (Custom 1)"; rec."Property Class (Custom 1)")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Main Asset/Component"; rec."Main Asset/Component")
                {
                    ApplicationArea = all;
                }
                field("Component of Main Asset"; rec."Component of Main Asset")
                {
                    ApplicationArea = all;
                }
                field("FA Add.-Currency Factor"; rec."FA Add.-Currency Factor")
                {
                    ApplicationArea = all;
                }
                field("Use Half-Year Convention"; rec."Use Half-Year Convention")
                {
                    ApplicationArea = all;
                }
                field("Use DB% First Fiscal Year"; rec."Use DB% First Fiscal Year")
                {
                    ApplicationArea = all;
                }
                field("Temp. Ending Date"; rec."Temp. Ending Date")
                {
                    ApplicationArea = all;
                }
                field("Temp. Fixed Depr. Amount"; rec."Temp. Fixed Depr. Amount")
                {
                    ApplicationArea = all;
                }
                field("Ignore Def. Ending Book Value"; rec."Ignore Def. Ending Book Value")
                {
                    ApplicationArea = all;
                }
                field("FA Book Type"; rec."FA Book Type")
                {
                    ApplicationArea = all;
                }
                field("FA Block Code"; rec."FA Block Code")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

