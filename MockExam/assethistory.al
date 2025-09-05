table 50150 "Asset Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Employee Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee Asset table" where(Status = const("Employee Asset Status"::Assigned)));
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }


}


page 50151 "Asset Cue Page"
{
    PageType = CardPart;
    SourceTable = "Asset Cue";
    ApplicationArea = All;
    Caption = 'Asset Cues';

    layout
    {
        area(content)
        {
            cuegroup(Assets)
            {
                field("Employee Count"; Rec."Employee Count")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Assigned Asset Fact";
                }
            }
        }
    }
}

pageextension 50152 Assetcue extends "Asset List"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(AssetCues; "Asset Cue Page")
            {
                ApplicationArea = All;
            }
        }
    }
}

codeunit 50160 "Asset Cue Init"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Cue: Record "Asset Cue";
    begin
        if not Cue.Get(1) then begin
            Cue.Init();
            Cue."Primary Key" := 1;
            Cue.Insert();
        end;
    end;
}


