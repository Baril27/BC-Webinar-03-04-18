table 50100 "AIR My Youtube Video"
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
        field(3; "Upload date"; Text[30])
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
        field(10; "Number of Watches"; Integer)
        {

        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK; "Number of Watches")
        {
            
        }
    }

    procedure Refresh();
    var
        RefreshMyYouTubeVideo : Codeunit "AIR Refresh My YouTube Video";
    begin
        RefreshMyYouTubeVideo.Refresh();
    end;


}