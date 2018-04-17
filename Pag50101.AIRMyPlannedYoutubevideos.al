page 50101 "AIR My Planned Youtube videos"
{
  PageType = List;
  SourceTable = "AIR My Planned Youtube Video";
  Editable = true;  
  InsertAllowed = false;
  DeleteAllowed = false;  
  UsageCategory = Lists;
  SourceTableView = sorting ("Prediction Number of Watches")  order (descending);


  layout
  {
    area(content)
    {
      repeater(GroupName)
      {
        field("Webinar Name";"Webinar Name")
        {
          ApplicationArea = Basic, Suite;
          Editable = false;
        }
        field("Prediction Number of Watches";"Prediction Number of Watches")
        {
          ApplicationArea = Basic, Suite;
          Editable = false;
        }
        field("Planned date";"Planned date")
        {
          ApplicationArea = All;
          Editable = false;
        }

        field(Category;Category)
        {
          ApplicationArea = All;
        }
        field("Auditory Size";"Auditory Size")
        {
          ApplicationArea = All;
        }
        field(Level;Level)
        {
          ApplicationArea = All;
        }
        field("Hot topic";"Hot topic")
        {
          ApplicationArea = All;
        }
        field("Auditory Type";"Auditory Type")
        {
          ApplicationArea = All;
        }
        field(Season;Season)
        {
          ApplicationArea = All;
        }
      }
    }
  }
  actions
  {
    area(processing)
    {
            action(Refresh)
            {
                CaptionML=ENU='Refresh';
                Promoted=true;
                PromotedCategory=Process;
                Image=RefreshLines;
                ApplicationArea = All;
                trigger OnAction();
                begin
                    Refresh();
                    CurrPage.Update;
                    if FindFirst then;
                end;
            }
            action(Predict)
            {
                CaptionML=ENU='Predict';
                Promoted=true;
                PromotedCategory=Process;
                Image=Forecast;
                ApplicationArea = All;
                trigger OnAction();
                begin
                    Predict();
                    CurrPage.Update;
                    if FindFirst then;
                end;
            }

    }
  }
}
