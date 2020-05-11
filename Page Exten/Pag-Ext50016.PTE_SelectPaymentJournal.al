pageextension 50016 "PTE_Select PaymentJournal" extends "Payment Journal"
{
    layout
    {
    }
    actions
    {
        /*addafter("Post and &Print")
        {
            // Add changes to page actions here
            action("PTE_Report Selections")
            {
                ApplicationArea = All;
                Caption = 'AV Print Document';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("Document No.", 14);
                    ReportPageList.Run;
                end;
            }
        }*/
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
