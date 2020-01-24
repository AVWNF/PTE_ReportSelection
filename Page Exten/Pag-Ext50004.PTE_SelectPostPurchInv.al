pageextension 50004 "PTE_Select Post Purch Inv" extends "Posted Purchase Invoice"
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
                Visible = false;
                Promoted = false;
                //PromotedCategory = Category6;
                //PromotedIsBig = true;
                //PromotedOnly = true;

                trigger OnAction()
                begin
                    ReportPageList.GetDocNo("No.", 2);
                    ReportPageList.Run;
                end;
            }
        }
    }
    var
        ReportPageList: Page "PTE_ReportSelection - List";
}
