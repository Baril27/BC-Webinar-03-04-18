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
                }
            }
        }
    }

    var
        [InDataSet]
        GreetingOfTheAudienceVisible: Boolean;
        GreetingOfTheAudienceText: Text;

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
        GreetingOfTheAudienceText := 'Welcome you on webinar!';

    end;

    [IntegrationEvent(false, false)]
    local procedure AIROnSetVisibility(var GreetingOfTheAudienceVisible: Boolean)
    begin
    end;

}