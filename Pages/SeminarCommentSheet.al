//2018-03-22 JOSVSTO
//Lab 5.2
page 123456703 "Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "Seminar Comment Line";
    Caption = 'Seminar Comment Sheet';
    UsageCategory = Tasks;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Date)
                {
                }
                field(Code; Code)
                {
                    Visible = false;
                }
                field(Comment; Comment)
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        SetupNewLine;
    end;
}