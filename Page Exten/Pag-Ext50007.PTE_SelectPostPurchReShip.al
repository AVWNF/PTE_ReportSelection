pageextension 50007 "PTE_Select PostPurchReShip" extends "Posted Return Shipment"
{
    layout
    {
    }
    actions
    {
        addafter("&Print")
        {
            // Add changes to page actions here
            action("PTE_Report Selections")
            {
                ApplicationArea = All;
                Caption = 'AV Print Document';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 5);
                    ReportPageList.Run;
                end;
            }
        }
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
