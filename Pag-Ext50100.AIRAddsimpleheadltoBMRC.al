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
        MyYouTubeVideos: Page "AIR My Youtube Videos";
    begin
        MyYouTubeVideos.Run();
    end;

    [IntegrationEvent(false, false)]
    local procedure AIROnSetVisibility(var GreetingOfTheAudienceVisible: Boolean)
    begin
    end;

}