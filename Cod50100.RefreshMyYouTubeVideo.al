codeunit 50100 "AIR Refresh My YouTube Video"
{
    procedure Refresh();
    var
        MyYouTubeVideo : Record "AIR My YouTube Video";
        HttpClient : HttpClient;
        ResponseMessage : HttpResponseMessage;
        JsonToken : JsonToken;
        JsonValue : JsonValue;
        JsonObject : JsonObject;
        JsonArray : JsonArray;
        JsonText : text;
        i : Integer;
    begin
        MyYouTubeVideo.DeleteAll;

        // Simple web service call
        HttpClient.DefaultRequestHeaders.Add('User-Agent','Dynamics 365');
        if not HttpClient.Get('https://getbridgeapp.co/api/webinar170418demo5/youtubevideos',
                              ResponseMessage)
        then
            Error('The call to the web service failed.');

        if not ResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\' +
                  'Status code: %1' +
                  'Description: %2',
                  ResponseMessage.HttpStatusCode,
                  ResponseMessage.ReasonPhrase);
        
        ResponseMessage.Content.ReadAs(JsonText);
        
        // Process JSON response
        if not JsonArray.ReadFrom(JsonText) then begin
            // probably single object
            JsonToken.ReadFrom(JsonText);
            InsertMyYouTubeVideo(JsonToken);
        end else begin    
            // array
            for i := 0 to JsonArray.Count - 1 do begin
                JsonArray.Get(i,JsonToken);
                InsertMyYouTubeVideo(JsonToken);
            end;
        end;
    end;

    local procedure InsertMyYouTubeVideo(JsonToken : JsonToken);
    var
        JsonObject : JsonObject;
        MyYouTubeVideo : Record "AIR My YouTube Video";
    begin
        JsonObject := JsonToken.AsObject;

        MyYouTubeVideo.init;
        
        MyYouTubeVideo."webinar name" := COPYSTR(GetJsonToken(JsonObject,'webinar_name').AsValue.AsText, 1, 250);
        MyYouTubeVideo."category" := COPYSTR(GetJsonToken(JsonObject,'category').AsValue.AsText, 1, 250);
        MyYouTubeVideo."auditory size" := COPYSTR(GetJsonToken(JsonObject,'auditory_size').AsValue.AsText, 1, 250);
        MyYouTubeVideo."level" := COPYSTR(GetJsonToken(JsonObject,'level').AsValue.AsText, 1, 250);
        MyYouTubeVideo."hot topic" := COPYSTR(GetJsonToken(JsonObject,'hot_topic').AsValue.AsText, 1, 250);
        MyYouTubeVideo."auditory type" := COPYSTR(GetJsonToken(JsonObject,'auditory_type').AsValue.AsText, 1, 250);
        MyYouTubeVideo."season" := COPYSTR(GetJsonToken(JsonObject,'season').AsValue.AsText, 1, 250);
        MyYouTubeVideo."number of watches" := GetJsonToken(JsonObject,'number_of_watches').AsValue.AsInteger;
        MyYouTubeVideo."Upload date" := GetJsonToken(JsonObject,'upload_date').AsValue().AsText();
        MyYouTubeVideo.Insert;
    end;

    local procedure GetJsonToken(JsonObject:JsonObject;TokenKey:text)JsonToken:JsonToken;
    begin
        if not JsonObject.Get(TokenKey,JsonToken) then
            Error('Could not find a token with key %1',TokenKey);
    end;
    local procedure SelectJsonToken(JsonObject:JsonObject;Path:text)JsonToken:JsonToken;
    begin
        if not JsonObject.SelectToken(Path,JsonToken) then
            Error('Could not find a token with path %1',Path);
    end;

}
