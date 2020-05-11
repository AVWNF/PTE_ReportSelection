pageextension 50013 "PTE_Select PostedSalesShip" extends "Posted Sales Shipment"
{
    layout
    {
    }
    actions
    {
        /*addafter("&Print")
        {
            // Add changes to page actions here
            action("PTE_Report Selections")
            {
                ApplicationArea = All;
                Caption = 'AV Print Document';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 11);
                    ReportPageList.Run;
                end;
            }
        }*/
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
