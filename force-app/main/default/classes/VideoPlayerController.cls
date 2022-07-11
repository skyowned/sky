public class VideoPlayerController {
    public string specificUrl{get;set;}
    public string videoUri{get;set;}
    public string videoId{get;set;}
    public VideoPlayerController()
    {
        videoUri=apexpages.currentpage().getparameters().get('video_uri');
    }
    public PageReference play()
    {
        system.debug(videoUri);
        videoId=videoUri!=null?videoUri.split('/')[2]:'';
        return null;
    }
    public PageReference authenticate() {
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        hr.setEndpoint('https://api.vimeo.com/me/videos');
        hr.setMethod('POST');
        //String client_id = '328d97d027b281f4ba7be9c81135d580efb0bea6';
        //String client_secret = 'hs/OYNWWSOtWPxAqCfeQWLh8ufSHdF6KuD+k1P3n4btJpxoBJkOhZcCEXlPlq/EAySCjZ9g/UPbHMCcF5MoBJuZpV4ttAA81ahOEjCnU2T1MAUAr4M4eeEVjdy3LgPuV';
        String Access_Token='ee1c4dbf045eccd7322bc9c8637b2723';
        string redirectUri='https://skyowned-dev-ed.my.salesforce.com/apex/videoplayer';
        //string user_id='73547665';
        //Blob headerValue = Blob.valueOf(client_id + ':' + client_secret);
        //String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        //hr.setHeader('Authorization', authorizationHeader);
        hr.setHeader('Authorization', 'Bearer '+Access_Token);
        hr.setHeader('Content-Type', 'application/x-www-form-urlenco‌ded');
        hr.setHeader('Content-Length', '0');
        hr.setBody('type=POST&redirect_url='+redirectUri);
        HttpResponse hres=h.send(hr);
		JSONParser  parser = JSON.createParser(hres.getBody());
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                String fieldName = parser.getText();
                parser.nextToken();
                String fieldValue=parser.getText();
                if(fieldName == 'form' ) {
                    specificUrl= parser.getText();
                    break;
                }
            }
        }
        system.debug('---Request--- '+hr.getBody());
        system.debug('---status code--- '+hres.getStatusCode());
        system.debug('---Response--- '+hres.getBody());
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,hres.getStatusCode()!=201?'Error in authentication':'Authenticated');
        ApexPages.addMessage(myMsg);
        return null;
    }
}