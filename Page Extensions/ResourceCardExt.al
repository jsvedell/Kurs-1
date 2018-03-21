pageextension 123456700 ResourceCardExt extends "Resource Card"
//CSD1.00 2018-03-21 JOSVSTO
{
    layout
    {
        addlast(General)
        {
            field("Resource Type";"Resource Type")
            {

            }
            field("Quantity per Day";"Quantity per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("Room")
            {
                field("Maximum Participants";"Maximum Participants")
                {
                    Visible = ShowMaxField;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage();
    begin
        ShowMaxField := (type = type::Machine);
        CurrPage.Update(false);        
    end;
    var
        [InDataSet]
        ShowMaxField: Boolean;
}