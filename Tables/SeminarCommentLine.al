table 123456704 "Seminar Comment Line"
//2018-03-22 JOSVSTO
//Lab 5.2
{
    caption = 'Seminar Comment Line';
    LookupPageId = "Seminar Comment List";
    DrillDownPageId = "Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionMembers = "Seminar", "Seminar Registration Header", "Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration Header,Posted Seminar Reg. Header';
        }
        field(20; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(30; "No."; code[20])
        {
            caption = 'No.';
            TableRelation = if("Table Name" = const (seminar)) Seminar
            else if("Table Name" = const ("Seminar Registration header")) "Seminar Registration Header";
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No,';
        }
        field(50; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(60; "Code"; code[10])
        {
            Caption = 'Code';
        }
        field(70; "Comment"; text[80])
        {
            caption = 'Comment';
        }

    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

    procedure SetupNewLine();
    var
        SeminarCommentLine: Record "Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name", "Table Name");
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        SeminarCommentLine.SetRange(Date, workdate);
        if SeminarCommentLine.IsEmpty then
            date := WorkDate;
    end;
}