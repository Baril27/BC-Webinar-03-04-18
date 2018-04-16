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
                field(NavSkillsPredictWatchesText; NavSkillsPredictWatchesText)
                {
                    ApplicationArea = Basic, Suite;
                    trigger OnDrillDown();
                    var
                    begin
                        OnDrillDownNavSkillsPredictWatches();
                    end;
                }

            }
        }
    }

    var
        [InDataSet]
        NavSkillsHeadlinesVisible: Boolean;
        NavSkillsWatchesText: Text;
        NavSkillsPredictWatchesText : Text;
        GreetingOfTheAudiencePayloadText: Text;

    trigger OnAfterGetRecord()
    begin
        HandleNavSkillsWatchesHeadline();
        HandleNavSkillsPredictWatchesHeadline();
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

    local procedure HandleNavSkillsPredictWatchesHeadline()
    var
        HeadlineManagement: Codeunit "Headline Management";
    begin
        NavSkillsHeadlinesVisible := true;
        GreetingOfTheAudiencePayloadText := 'You have ' +
                                            HeadlineManagement.Emphasize(GetNumberOfPlannedYoutubeWebinars) +
                                            ' planned webinars with ' +
                                            HeadlineManagement.Emphasize(GetNumberOfPredictedYoutubeWatches) +
                                            ' predicted watches !'
                                            ;
        HeadlineManagement.GetHeadlineText('NAV Skills - Future Webinars', GreetingOfTheAudiencePayloadText, NavSkillsPredictWatchesText);
        //Message(GreetingOfTheAudienceText);
    end;

    local procedure GetNumberOfPlannedYoutubeWebinars(): Text
    var
        MyPlannedYouTubeVideos: Record "AIR My Planned Youtube Video";
    begin
        MyPlannedYouTubeVideos.Refresh();
        EXIT(Format(MyPlannedYouTubeVideos.Count));
    end;

    local procedure GetNumberOfPredictedYoutubeWatches(): Text
    var
        MyPlannedYouTubeVideos: Record "AIR My Planned Youtube Video";
    begin
        MyPlannedYouTubeVideos.Predict();
        MyPlannedYouTubeVideos.CalcSums("Prediction Number of Watches");
        EXIT(Format(MyPlannedYouTubeVideos."Prediction Number of Watches"));
    end;

    local procedure OnDrillDownNavSkillsPredictWatches();
    var
        MyPlannedYouTubeVideos: Page "AIR My Planned Youtube Videos";
    begin
        MyPlannedYouTubeVideos.Run();
    end;



    [IntegrationEvent(false, false)]
    local procedure AIROnSetVisibility(var GreetingOfTheAudienceVisible: Boolean)
    begin
    end;

}