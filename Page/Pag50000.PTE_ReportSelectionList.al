page 50000 "PTE_ReportSelection - List"
{
    Caption = 'ReportSelection - List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Report Selections";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field("Report Selection"; ReportSelect)
            {
                ApplicationArea = All;
                Editable = false;

                trigger OnValidate()
                begin
                    SetFilterUsage();
                end;
            }
            field(DocNo; DocNo)
            {
                ApplicationArea = All;
                Caption = 'Document No.';
                Editable = false;
            }
            repeater(GroupName)
            {
                field("Report ID"; "Report ID")
                {
                    ApplicationArea = all;
                }
                field("Report Caption"; "Report Caption")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Reporting)
        {
            action("Run-Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction();
                begin
                    IF TestRunReport = false then begin
                        Report.RunModal("Report ID", true, false);
                        /*CASE ReportSelect OF
                                          ReportSelect::"Purch. Quote":
                                              begin
                                                  Clear(PurchH);
                                                  PurchH.SetCurrentKey("No.");
                                                  PurchH.SetRange("No.", DocNo);
                                                  IF PurchH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchH);
                                              end;
                                          ReportSelect::"Purch. Order":
                                              begin
                                                  Clear(PurchH);
                                                  PurchH.SetCurrentKey("No.");
                                                  PurchH.SetRange("No.", DocNo);
                                                  IF PurchH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchH);
                                              end;
                                          ReportSelect::"Purch. Ivnoice":
                                              begin
                                                  Clear(PurchInv);
                                                  PurchInv.SetCurrentKey("No.");
                                                  PurchInv.SetRange("No.", DocNo);
                                                  IF PurchInv.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchInv);
                                              end;
                                          ReportSelect::"Purch. CreditMemo":
                                              begin
                                                  Clear(PurchCNH);
                                                  PurchCNH.SetCurrentKey("No.");
                                                  PurchCNH.SetRange("No.", DocNo);
                                                  IF PurchCNH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchCNH);
                                              end;
                                          ReportSelect::"Purch. Receipt":
                                              begin
                                                  Clear(PurchReceipt);
                                                  PurchReceipt.SetCurrentKey("No.");
                                                  PurchReceipt.SetRange("No.", DocNo);
                                                  IF PurchReceipt.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchReceipt);
                                              end;
                                          ReportSelect::"Purch. Return":
                                              begin
                                                  Clear(PurchReturn);
                                                  PurchReturn.SetCurrentKey("No.");
                                                  PurchReturn.SetRange("No.", DocNo);
                                                  IF PurchReturn.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchReturn);
                                              end;
                                          ReportSelect::"Purch. Return Order":
                                              begin
                                                  Clear(PurchH);
                                                  PurchH.SetCurrentKey("No.");
                                                  PurchH.SetRange("No.", DocNo);
                                                  IF PurchH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, PurchH);
                                              end;
                                          ReportSelect::"Sales Quote":
                                              begin
                                                  Clear(salesH);
                                                  salesH.SetCurrentKey("No.");
                                                  salesH.SetRange("No.", DocNo);
                                                  IF salesH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesH);
                                              end;
                                          ReportSelect::"Sales Order":
                                              begin
                                                  Clear(salesH);
                                                  salesH.SetCurrentKey("No.");
                                                  salesH.SetRange("No.", DocNo);
                                                  IF salesH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesH);
                                              end;
                                          ReportSelect::"Sales Ivnoice":
                                              begin
                                                  Clear(salesInvH);
                                                  salesInvH.SetCurrentKey("No.");
                                                  salesInvH.SetRange("No.", DocNo);
                                                  IF salesInvH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesInvH);
                                              end;
                                          ReportSelect::"Sales CreditMemo":
                                              begin
                                                  Clear(salesCnH);
                                                  salesCnH.SetCurrentKey("No.");
                                                  salesCnH.SetRange("No.", DocNo);
                                                  IF salesCnH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesCnH);
                                              end;
                                          ReportSelect::"Sales Shipment":
                                              begin
                                                  Clear(salesShipmentH);
                                                  salesShipmentH.SetCurrentKey("No.");
                                                  salesShipmentH.SetRange("No.", DocNo);
                                                  IF salesShipmentH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesShipmentH);
                                              end;
                                          ReportSelect::"Sales Return":
                                              begin
                                                  Clear(salesReturn);
                                                  salesReturn.SetCurrentKey("No.");
                                                  salesReturn.SetRange("No.", DocNo);
                                                  IF salesReturn.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesReturn);
                                              end;
                                          ReportSelect::"Sales Return Order":
                                              begin
                                                  Clear(salesH);
                                                  salesH.SetCurrentKey("No.");
                                                  salesH.SetRange("No.", DocNo);
                                                  IF salesH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, salesH);
                                              end;
                                          ReportSelect::"Payment Journal":
                                              begin
                                                  Clear(GenJnlLine);
                                                  GenJnlLine.SetCurrentKey("Document No.");
                                                  GenJnlLine.SetRange("Document No.", DocNo);
                                                  IF GenJnlLine.FindFirst then
                                                      Report.RunModal("Report ID", true, false, GenJnlLine);
                                              end;
                                          ReportSelect::"Transfer Order":
                                              begin
                                                  Clear(TranfersH);
                                                  TranfersH.SetCurrentKey("No.");
                                                  TranfersH.SetRange("No.", DocNo);
                                                  IF TranfersH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, TranfersH);
                                              end;
                                          ReportSelect::"Transfer Shipment":
                                              begin
                                                  Clear(TransferShipH);
                                                  TransferShipH.SetCurrentKey("No.");
                                                  TransferShipH.SetRange("No.", DocNo);
                                                  IF TransferShipH.FindFirst then
                                                      Report.RunModal("Report ID", true, false, TransferShipH);
                                              end;
                                      end;*/
                    end;
                end;
            }
        }
    }
    var
        ReportSelect: Option "Purch. Quote","Purch. Order","Purch. Ivnoice","Purch. CreditMemo","Purch. Receipt","Purch. Return","Purch. Return Order","Sales Quote","Sales Order","Sales Ivnoice","Sales CreditMemo","Sales Shipment","Sales Return","Sales Return Order","Payment Journal","Transfer Order","Transfer Shipment";
        PurchH: Record "Purchase Header";
        PurchInv: Record "Purch. Inv. Header";
        PurchCNH: Record "Purch. Cr. Memo Hdr.";
        PurchReceipt: Record "Purch. Rcpt. Header";
        PurchReturn: Record "Return Shipment Header";
        salesH: Record "Sales Header";
        salesInvH: Record "Sales Invoice Header";
        salesCNH: Record "Sales Cr.Memo Header";
        salesShipmentH: Record "Sales Shipment Header";
        salesReturn: Record "Return Receipt Header";
        GenJnlLine: Record "Gen. Journal Line";
        TranfersH: Record "Transfer Header";
        TransferShipH: Record "Transfer Shipment Header";
        DocNo: Code[20];

    trigger OnOpenPage()
    begin
        SetFilterUsage();
    end;

    local procedure SetFilterUsage()//var
                                    //myPTE: PTEeger;
    begin
        CASE ReportSelect OF
            ReportSelect::"Purch. Quote":
                SetRange(Usage, Usage::"P.Quote");
            ReportSelect::"Purch. Order":
                SetRange(Usage, Usage::"P.Order");
            ReportSelect::"Purch. Ivnoice":
                SetRange(Usage, Usage::"P.Invoice");
            ReportSelect::"Purch. CreditMemo":
                SetRange(Usage, Usage::"P.Cr.Memo");
            ReportSelect::"Purch. Receipt":
                SetRange(Usage, Usage::"P.Receipt");
            ReportSelect::"Purch. Return":
                SetRange(Usage, Usage::"P.Ret.Shpt.");
            ReportSelect::"Purch. Return Order":
                SetRange(Usage, Usage::"P.Return");
            ReportSelect::"Sales Quote":
                SetRange(Usage, Usage::"S.Quote");
            ReportSelect::"Sales Order":
                SetRange(Usage, Usage::"S.Order");
            ReportSelect::"Sales Ivnoice":
                SetRange(Usage, Usage::"S.Invoice");
            ReportSelect::"Sales CreditMemo":
                SetRange(Usage, Usage::"S.Cr.Memo");
            ReportSelect::"Sales Shipment":
                SetRange(Usage, Usage::"S.Shipment");
            ReportSelect::"Sales Return":
                SetRange(Usage, Usage::"S.Ret.Rcpt.");
            ReportSelect::"Sales Return Order":
                SetRange(Usage, Usage::"S.Return");
            ReportSelect::"Payment Journal":
                SetRange(Usage, Usage::"B.Check");
            ReportSelect::"Transfer Order":
                SetRange(Usage, Usage::Inv1);
            ReportSelect::"Transfer Shipment":
                SetRange(Usage, Usage::Inv2);
        end;
        CurrPage.UPDATE;
    end;

    procedure GetDocNo(GetDocNo: Code[20];
    GetReportSelect: Option "Purch. Quote","Purch. Order","Purch. Ivnoice","Purch. CreditMemo","Purch. Receipt","Purch. Return","Purch. Return Order","Sales Quote","Sales Order","Sales Ivnoice","Sales CreditMemo","Sales Shipment","Sales Return","Sales Return Order","Payment Journal","Transfer Order","Transfer Shipment")
    var //GetDocNo: Code[20];
    begin
        Clear(DocNo);
        DocNo := GetDocNo;
        ReportSelect := GetReportSelect;
    end;

    [TryFunction]
    procedure "TestRunReport"()
    begin
        // [GIVEN] Given Some State 
        // [WHEN] When Some Action 
        // [THEN] Then Expected Output 
        CASE ReportSelect OF
            ReportSelect::"Purch. Quote":
                begin
                    Clear(PurchH);
                    PurchH.SetCurrentKey("No.");
                    PurchH.SetRange("Document Type", PurchH."Document Type"::Quote);
                    PurchH.SetRange("No.", DocNo);
                    IF PurchH.FindFirst then Report.RunModal("Report ID", true, false, PurchH);
                end;
            ReportSelect::"Purch. Order":
                begin
                    Clear(PurchH);
                    PurchH.SetCurrentKey("No.");
                    PurchH.SetRange("Document Type", PurchH."Document Type"::Order);
                    PurchH.SetRange("No.", DocNo);
                    IF PurchH.FindFirst then Report.RunModal("Report ID", true, false, PurchH);
                end;
            ReportSelect::"Purch. Ivnoice":
                begin
                    Clear(PurchInv);
                    PurchInv.SetCurrentKey("No.");
                    PurchInv.SetRange("No.", DocNo);
                    IF PurchInv.FindFirst then Report.RunModal("Report ID", true, false, PurchInv);
                end;
            ReportSelect::"Purch. CreditMemo":
                begin
                    Clear(PurchCNH);
                    PurchCNH.SetCurrentKey("No.");
                    PurchCNH.SetRange("No.", DocNo);
                    IF PurchCNH.FindFirst then Report.RunModal("Report ID", true, false, PurchCNH);
                end;
            ReportSelect::"Purch. Receipt":
                begin
                    Clear(PurchReceipt);
                    PurchReceipt.SetCurrentKey("No.");
                    PurchReceipt.SetRange("No.", DocNo);
                    IF PurchReceipt.FindFirst then Report.RunModal("Report ID", true, false, PurchReceipt);
                end;
            ReportSelect::"Purch. Return":
                begin
                    Clear(PurchReturn);
                    PurchReturn.SetCurrentKey("No.");
                    PurchReturn.SetRange("No.", DocNo);
                    IF PurchReturn.FindFirst then Report.RunModal("Report ID", true, false, PurchReturn);
                end;
            ReportSelect::"Purch. Return Order":
                begin
                    Clear(PurchH);
                    PurchH.SetCurrentKey("No.");
                    PurchH.SetRange("Document Type", PurchH."Document Type"::"Return Order");
                    PurchH.SetRange("No.", DocNo);
                    IF PurchH.FindFirst then Report.RunModal("Report ID", true, false, PurchH);
                end;
            ReportSelect::"Sales Quote":
                begin
                    Clear(salesH);
                    salesH.SetCurrentKey("No.");
                    salesH.SetRange("Document Type", salesH."Document Type"::Quote);
                    salesH.SetRange("No.", DocNo);
                    IF salesH.FindFirst then Report.RunModal("Report ID", true, false, salesH);
                end;
            ReportSelect::"Sales Order":
                begin
                    Clear(salesH);
                    salesH.SetCurrentKey("No.");
                    salesH.SetRange("Document Type", salesH."Document Type"::Order);
                    salesH.SetRange("No.", DocNo);
                    IF salesH.FindFirst then Report.RunModal("Report ID", true, false, salesH);
                end;
            ReportSelect::"Sales Ivnoice":
                begin
                    Clear(salesInvH);
                    salesInvH.SetCurrentKey("No.");
                    salesInvH.SetRange("No.", DocNo);
                    IF salesInvH.FindFirst then Report.RunModal("Report ID", true, false, salesInvH);
                end;
            ReportSelect::"Sales CreditMemo":
                begin
                    Clear(salesCnH);
                    salesCnH.SetCurrentKey("No.");
                    salesCnH.SetRange("No.", DocNo);
                    IF salesCnH.FindFirst then Report.RunModal("Report ID", true, false, salesCnH);
                end;
            ReportSelect::"Sales Shipment":
                begin
                    Clear(salesShipmentH);
                    salesShipmentH.SetCurrentKey("No.");
                    salesShipmentH.SetRange("No.", DocNo);
                    IF salesShipmentH.FindFirst then Report.RunModal("Report ID", true, false, salesShipmentH);
                end;
            ReportSelect::"Sales Return":
                begin
                    Clear(salesReturn);
                    salesReturn.SetCurrentKey("No.");
                    salesReturn.SetRange("No.", DocNo);
                    IF salesReturn.FindFirst then Report.RunModal("Report ID", true, false, salesReturn);
                end;
            ReportSelect::"Sales Return Order":
                begin
                    Clear(salesH);
                    salesH.SetCurrentKey("No.");
                    salesH.SetRange("Document Type", salesH."Document Type"::"Return Order");
                    salesH.SetRange("No.", DocNo);
                    IF salesH.FindFirst then Report.RunModal("Report ID", true, false, salesH);
                end;
            ReportSelect::"Payment Journal":
                begin
                    Clear(GenJnlLine);
                    GenJnlLine.SetCurrentKey("Document No.");
                    GenJnlLine.SetRange("Document No.", DocNo);
                    IF GenJnlLine.FindFirst then Report.RunModal("Report ID", true, false, GenJnlLine);
                end;
            ReportSelect::"Transfer Order":
                begin
                    Clear(TranfersH);
                    TranfersH.SetCurrentKey("No.");
                    TranfersH.SetRange("No.", DocNo);
                    IF TranfersH.FindFirst then Report.RunModal("Report ID", true, false, TranfersH);
                end;
            ReportSelect::"Transfer Shipment":
                begin
                    Clear(TransferShipH);
                    TransferShipH.SetCurrentKey("No.");
                    TransferShipH.SetRange("No.", DocNo);
                    IF TransferShipH.FindFirst then Report.RunModal("Report ID", true, false, TransferShipH);
                end;
        end;
    end;
}
