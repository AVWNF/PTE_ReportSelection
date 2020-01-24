pageextension 50009 "PTE_Select SalesQuote" extends "Sales Quote"
{
    layout
    {
    }
    actions
    {
        addafter(Print)
        {
            // Add changes to page actions here
            action("PTE_Report Selections")
            {
                ApplicationArea = All;
                Caption = 'AV Print Document';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 7);
                    ReportPageList.Run;
                end;
            }
        }
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
