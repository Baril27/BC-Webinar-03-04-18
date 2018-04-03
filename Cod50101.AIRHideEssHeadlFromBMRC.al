codeunit 50101 "AIR Hide Ess. Headl. From BMRC"
{
    trigger OnRun()
    begin
        
    end;
    
    [EventSubscriber(ObjectType::Page, Page::"Headline RC Business Manager", 'OnSetVisibility', '', false, false)]
    local procedure HideSomeOrAllOfEssentialsHeadlines(var MostPopularItemVisible: Boolean;var MostPopularItemText: Text[250];
                                    var LargestOrderVisible: Boolean;var LargestOrderText: Text[250];
                                    var LargestSaleVisible: Boolean;var LargestSaleText: Text[250];
                                    var SalesIncreaseVisible: Boolean;var SalesIncreaseText:  Text[250];
                                    var BusiestResourceVisible: Boolean;var BusiestResourceText: Text[250];
                                    var TopCustomerVisible: Boolean;var TopCustomerText: Text[250])
    begin
        MostPopularItemVisible := false;
        TopCustomerVisible := false;
    end;
}