pageextension 50100 "AIR Add simple headl. to BM RC" extends "Headline RC Business Manager" //MyTargetPageId
{
    layout
    {
        addlast(Content)
        {

            group(GreetingOfTheAudience)
            {
                Visible = GreetingOfTheAudienceVisible;
                ShowCaption = false;
                Editable = false;

                field(GreetingOfTheAudienceText; GreetingOfTheAudienceText)
                {
                    ApplicationArea = Basic, Suite;
                    trigger OnDrillDown();
                    var
                        Employee: Record Employee;
                        YouTubeHeadlineURL: Text;
                    begin
                        YouTubeHeadlineURL := 'https://www.youtube.com/watch?v=uDFvG64TkEI&list=PLhZ3P-LY7CqnJY3p9AuwSBC6TOgYFPnY3';
                        HYPERLINK(YouTubeHeadlineURL);
                    end;
                }
            }
        }
    }

    var
        [InDataSet]
        GreetingOfTheAudienceVisible: Boolean;
        GreetingOfTheAudienceText: Text;
        GreetingOfTheAudiencePayloadText: Text;

    trigger OnAfterGetRecord()
    begin
        HandleGreetingAudinenceHeadline();
        AIROnSetVisibility(GreetingOfTheAudienceVisible);
    end;

    local procedure HandleGreetingAudinenceHeadline()
    var
        HeadlineManagement: Codeunit "Headline Management";
    begin
        GreetingOfTheAudienceVisible := true;
        GreetingOfTheAudiencePayloadText := 'You have '+
                                            HeadlineManagement.Emphasize(GetNumberOfYoutubeWatches) +
                                            ' watches in Youtube!';
        HeadlineManagement.GetHeadlineText('NAV Skills - Webinars',GreetingOfTheAudiencePayloadText,GreetingOfTheAudienceText);
        //Message(GreetingOfTheAudienceText);
    end;

    local procedure GetNumberOfYoutubeWatches () :Text
    var 
            MyYouTubeVideos : Record "AIR My Youtube Video";
    begin
        MyYouTubeVideos.Refresh();
        MyYouTubeVideos.CalcSums("Number of Watches");
        EXIT(Format(MyYouTubeVideos."Number of Watches"));
    end;

    [IntegrationEvent(false,false)]
    local procedure AIROnSetVisibility(var GreetingOfTheAudienceVisible: Boolean)
    begin
    end;

}