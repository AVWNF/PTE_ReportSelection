pageextension 50011 "PTE_Select PostedSalesInv" extends "Posted Sales Invoice"
{
    layout
    {
    }
    actions
    {
        /*
        addafter(Print)
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
                    ReportPageList.GetDocNo("No.", 9);
                    ReportPageList.Run;
                end;
            }
        }
        */
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
