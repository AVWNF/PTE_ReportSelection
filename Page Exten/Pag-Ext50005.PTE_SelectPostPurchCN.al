pageextension 50005 "PTE_Select Post Purch CN" extends "Posted Purchase Credit Memo"
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
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 3);
                    ReportPageList.Run;
                end;
            }
        }
        */
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
