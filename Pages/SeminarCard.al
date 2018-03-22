page 123456701 "Seminar Page"
//2018-03-22 JOSVSTO
//Lab 5.2
{
    PageType = Card;
    SourceTable = Seminar;
    Caption = 'Seminar Card';
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    trigger OnAssistEdit();
                    begin
                        if Assistedit then
                            CurrPage.Update;
                    end;
                }
                field("Name"; Name)
                {
                }
                field("Search Name"; "Search Name")
                {
                }
                field("Seminar Duration"; "Seminar Duration")
                {
                }
                field("Minimun Participants"; "Minimum Participants")
                {
                }
                field("Maximum Participants"; "Maximum Participants")
                {
                }
                field("Blocked"; Blocked)
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                }
                field("Seminar Price"; "Seminar Price")
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
                    Promoted = True;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
            }
        }
    }

    var
        myInt: Integer;
}