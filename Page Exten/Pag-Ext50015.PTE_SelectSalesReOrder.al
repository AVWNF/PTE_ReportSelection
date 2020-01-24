pageextension 50015 "PTE_Select SalesReOrder" extends "Sales Return Order"
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
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 13);
                    ReportPageList.Run;
                end;
            }
        }
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
