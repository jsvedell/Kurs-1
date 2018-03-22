page 123456702 "Seminar List"
//2018-03-22 JOSVSTO
//Lab 5.2
{
    PageType = List;
    SourceTable = Seminar;
    caption = 'Seminar List';
    Editable = false;
    CardPageId = 123456701;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Name";Name)
                {
                }
                field("Seminar Duration";"Seminar Duration")
                {
                }
                field("Seminar Price";"Seminar Price")
                {
                }
                field("Minimum Participants";"Minimum Participants")
                {
                }
                field("Maximum Participants";"Maximum Participants")
                {
                }
                
            }
        }
        area(FactBoxes)
        {
            systempart("Links";Links)
            {

            }
            systempart("Notes";Notes)
            {

            }
        }        
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    //RunObject = page "Seminar Comment Sheet";
                    //RunPageLink = "table name" = const(Seminar),"No." = field("No.");
                    Image = Comment;
                }
            }
        }
    }
}