namespace Training.Training;
table 50196 "Employee Asset Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = SystemMetadata;

        }
        field(2; Count; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee Asset table");
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }



}

page 50199 "Employee Asset cuepage"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Asset Cue";

    layout
    {
        area(content)
        {
            cuegroup(EmployeeAssetcue)
            {
                field(Count; Rec.Count)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Asset History";
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        AssetCue: Record "Employee Asset Cue"; // ✅ corrected
    begin
        if not AssetCue.Get(1) then begin
            AssetCue.Init();
            AssetCue.MyField := 1; // ✅ use your PK
            AssetCue.Insert();
        end;
    end;
}



page 50139 "Asset History"
{
    ApplicationArea = All;
    Caption = 'Asset History';
    PageType = ListPart;
    SourceTable = "Employee Asset table";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}


pageextension 50197 Assethistory extends "Employee Asset List"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part("Employee Asset"; "Employee Asset cuepage")
            {

                ApplicationArea = All;
            }
        }
    }

}