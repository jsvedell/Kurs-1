table 123456701 Seminar
//2018-03-22 JOSVSTO
//Lab 5.2
{
    caption = 'Seminar';
    fields
    {
        field(10; "No."; code[20])
        {
            caption = 'No.';
            trigger OnValidate();
            begin
                if "no." <> xRec."No." then begin
                    SeminarSetup.get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            trigger OnValidate();
            begin
                if("Search Name" = UpperCase(xRec.Name)) or("Search Name" = '') then
                    "Search Name" := name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(60; "Search Name"; code[50])
        {
            Caption = 'Search Name';
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Seminar Comment Line" where ("Table Name" = filter("Seminar"), "No." = field ("No.")));
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if(xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "VAT Prod. Posting Group") then
                        validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; code[10])
        {
            Editable = false;
            caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "Seminar Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        CommentLine : record "Seminar Comment Line";
        Seminar: Record Seminar;
        GenProdPostingGroup: Record "Gen. Product Posting Group";


    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := workdate;
    end;

    trigger OnDelete();
    begin
                CommentLine.Reset;
                CommentLine.SetRange("Table Name",123456701);
                CommentLine.SetRange("no.","no.");
                CommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := workdate;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do
        begin
            Seminar := rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("no.");
                rec := Seminar;
                exit(true);
            end;
        end;
    end;
}