page 50100 "AIR My Youtube videos"
{
  PageType = List;
  SourceTable = "AIR My Youtube Video";
  Editable = false;    
  UsageCategory = Lists;
  SourceTableView = sorting ("Number of Watches")  order (descending);


  layout
  {
    area(content)
    {
      repeater(GroupName)
      {
        field("Webinar Name";"Webinar Name")
        {
          ApplicationArea = Basic, Suite;
        }
        field("Number of Watches";"Number of Watches")
        {
          ApplicationArea = Basic, Suite;
        }
        field("Upload date";"Upload date")
        {
          ApplicationArea = All;
        }
        field(Category;Category)
        {
          ApplicationArea = All;
          Visible = false;
        }
        field("Auditory Size";"Auditory Size")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field(Level;Level)
        {
          ApplicationArea = All;
          Visible = false;
        }
        field("Hot topic";"Hot topic")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field("Auditory Type";"Auditory Type")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field(Season;Season)
        {
          ApplicationArea = All;
          Visible = false;
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
    }
  }
}
