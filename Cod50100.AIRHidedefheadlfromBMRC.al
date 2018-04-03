codeunit 50100 "AIR Hide def. headl. from BMRC"
{
    //Hide standard headlines from Business Manager Role Center
    trigger OnRun()
    begin
        
    end;
    
    [EventSubscriber(ObjectType::Page, Page::"Headline RC Business Manager", 'OnIsAnyExtensionHeadlineVisible', '', true, true)]
    local procedure HideDefaultHeadlines(var ExtensionHeadlinesVisible: Boolean)
    begin
        ExtensionHeadlinesVisible := true; // hide default headline
    end;

/*     [EventSubscriber(ObjectType::Page, Page::"Headline RC Business Manager", 'OnIsAnyExtensionHeadlineVisible', '', true, true)]
    local procedure ShowDefaultHeadlines(var ExtensionHeadlinesVisible: Boolean)
    begin
        ExtensionHeadlinesVisible := false; // show default headline
    end;
 */
 }