pageextension 123456701 ResourceListExt extends "Resource List"
//CSD1.00 2018-03-21 JOSVSTO
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(type)
        {
            field("Resource Type"; "Resource Type")
            {

            }
            field("Maximum Participants"; "Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(type) = '');
        ShowMaxField := (GetFilter(type) = format(type::Machine));
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}