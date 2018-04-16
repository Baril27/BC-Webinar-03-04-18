codeunit 50100 "AIR Show doc. headl. from BMRC"
{
    //Show/Hide documentation headline from Business Manager Role Center

    trigger OnRun()
    begin
    end;
    
/*     [EventSubscriber(ObjectType::Page, Page::"Headline RC Business Manager", 'OnIsAnyExtensionHeadlineVisible', '', true, true)]
    local procedure HideDocumentationHeadline(var ExtensionHeadlinesVisible: Boolean)
    begin
        ExtensionHeadlinesVisible := true; // hide default headline
    end; */

    [EventSubscriber(ObjectType::Page, Page::"Headline RC Business Manager", 'OnIsAnyExtensionHeadlineVisible', '', true, true)]
    local procedure ShowDocumentationHeadline(var ExtensionHeadlinesVisible: Boolean)
    begin
        ExtensionHeadlinesVisible := false; // show default headline
    end;

 }