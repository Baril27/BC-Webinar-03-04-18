pageextension 50100 "AIR Add simple headl. to BM RC" extends "Headline RC Business Manager" //MyTargetPageId
{
    layout
    {
        addlast(Content)
        {

            group(NavSkillsHeadlines)
            {
                Visible = NavSkillsHeadlinesVisible;
                ShowCaption = false;
                Editable = false;

                field(NavSkillsWatchesText; NavSkillsWatchesText)
                {
                    ApplicationArea = Basic, Suite;
                    trigger OnDrillDown();
                    var
                    begin
                        OnDrillDownNavSkillsWatches();
                    end;
                }
            }
        }
    }

    var
        [InDataSet]
        NavSkillsHeadlinesVisible: Boolean;
        NavSkillsWatchesText: Text;
        GreetingOfTheAudiencePayloadText: Text;

    trigger OnAfterGetRecord()
    begin
        HandleNavSkillsWatchesHeadline();
        AIROnSetVisibility(NavSkillsHeadlinesVisible);
    end;

    local procedure HandleNavSkillsWatchesHeadline()
    var
        HeadlineManagement: Codeunit "Headline Management";
    begin
        NavSkillsHeadlinesVisible := true;
        GreetingOfTheAudiencePayloadText := 'You have ' +
                                            HeadlineManagement.Emphasize(GetNumberOfYoutubeWatches) +
                                            ' watches in Youtube!';
        HeadlineManagement.GetHeadlineText('NAV Skills - Webinars', GreetingOfTheAudiencePayloadText, NavSkillsWatchesText);
        //Message(GreetingOfTheAudienceText);
    end;

    local procedure GetNumberOfYoutubeWatches(): Text
    var
        MyYouTubeVideos: Record "AIR My Youtube Video";
    begin
        MyYouTubeVideos.Refresh();
        MyYouTubeVideos.CalcSums("Number of Watches");
        EXIT(Format(MyYouTubeVideos."Number of Watches"));
    end;

    local procedure OnDrillDownNavSkillsWatches();
    var
    begin
        Hyperlink('https://www.youtube.com/watch?v=uDFvG64TkEI&list=PLhZ3P-LY7CqnJY3p9AuwSBC6TOgYFPnY3');;
    end;

    [IntegrationEvent(false, false)]
    local procedure AIROnSetVisibility(var GreetingOfTheAudienceVisible: Boolean)
    begin
    end;

}