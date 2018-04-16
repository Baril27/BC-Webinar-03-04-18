codeunit 50102 "AIR Make Watches Prediction"
{
    procedure Predict(MyPlannedYouTubeVideo : Record "AIR My Planned Youtube Video") Result :Text;
    var
      AzureMLConnector : Codeunit "Azure ML Connector";
      ResultInt : Integer;
    begin
        AzureMLConnector.Initialize(
            '/4xamOeu5b4JvhHOThYNssIt5I1h5PkbPte0qzFDVqjms2U2KaB9Utxcq5ToHkVEJPtwXcyWPUW7dAZrfQnD5A==',
            'https://europewest.services.azureml.net/subscriptions/d0e75c3ca34a455b9d44667cd10c9756/services/f213613ba7354e36891099d1f46e7c9c/execute?api-version=2.0&details=true',
            30);
        AzureMLConnector.SetInputName('input1');
        AzureMLConnector.SetOutputName('output1');

        AzureMLConnector.AddInputColumnName('Category');
        AzureMLConnector.AddInputColumnName('Auditory size');
        AzureMLConnector.AddInputColumnName('Level');
        AzureMLConnector.AddInputColumnName('Hot Topic');
        AzureMLConnector.AddInputColumnName('Auditory type');
        AzureMLConnector.AddInputColumnName('Season');

        AzureMLConnector.AddInputRow();
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo.Category);
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo."Auditory Size");
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo.Level);
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo."Hot topic");
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo."Auditory Type");
        AzureMLConnector.AddInputValue(MyPlannedYouTubeVideo.Season);
        
        AzureMLConnector.SendToAzureML(false);

        IF AzureMLConnector.GetOutput(1,1,Result) then
           Exit(Result);
           
        Exit('0');
    end;
}