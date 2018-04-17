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
        field(3; "Planned date"; Text[30])
        {

        }

        field(4; "Category"; Option)
        {
            OptionMembers = "C/Side",Docker,"Extensions","PowerShell","Product","Reporting","SCM","Testing","Upgrade" ;
        }

        field(5; "Auditory Size"; Option)
        {
            OptionMembers = narrow,wide;
        }
        field(6; Level; Option)
        {
            OptionMembers = Advanced,Intermediate;
        }
        field(7; "Hot topic"; Option)
        {
            OptionMembers = No,Yes;

        }
        field(8; "Auditory Type"; Option)
        {
            OptionMembers = All,Developers,Testers;
        }
        field(9; "Season"; Option)
        {
            OptionMembers = Winter,Spring,Summer,Autumn;
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