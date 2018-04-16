table 50101 "AIR My Planned Youtube Video"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Webinar Name"; Text[250])
        {

        }

        field(4; "Category"; Text[30])
        {

        }

        field(5; "Auditory Size"; Text[30])
        {

        }
        field(6; Level; Text[30])
        {

        }
        field(7; "Hot topic"; Text[30])
        {

        }
        field(8; "Auditory Type"; Text[30])
        {

        }
        field(9; "Season"; Text[30])
        {

        }
        field(10; "Prediction Number of Watches"; Integer)
        {

        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK; "Prediction Number of Watches")
        {
            
        }
    }

    procedure Refresh();
    var
        RefreshMyPlannedYouTubeVideo : Codeunit "AIR Refresh My Planned YT Vid.";
    begin
        RefreshMyPlannedYouTubeVideo.Refresh();
    end;

    procedure Predict();
    var
        PredictMyPlannedYouTubeVideoWatches : Codeunit "AIR Make Watches Prediction";
        MyPlannedYouTubeVideo : Record "AIR My Planned Youtube Video";
        PredictedWatches :Decimal;
    begin
        IF MyPlannedYouTubeVideo.FindFirst() then
        repeat
           EVALUATE(PredictedWatches,PredictMyPlannedYouTubeVideoWatches.Predict(MyPlannedYouTubeVideo));
           MyPlannedYouTubeVideo."Prediction Number of Watches" := Round(PredictedWatches,1);
           MyPlannedYouTubeVideo.Modify();
        until MyPlannedYouTubeVideo.Next() = 0;
    end;



}