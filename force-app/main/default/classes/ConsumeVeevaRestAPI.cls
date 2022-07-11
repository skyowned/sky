public class ConsumeVeevaRestAPI {
    public static  void ConsumePostWithUnamePass()
    {
        /*HttpRequest hr1=new HttpRequest();
        Http h1=new Http();
        hr1.setEndpoint('https://sb-allergan-promomats-sbx.veevavault.com/api/v16.0/auth?username=arundhati.mukhopadhyay@sb-allergan.com&password=VAE@2017');
        hr1.setMethod('POST');
        hr1.setHeader('Content-Type', 'application/json');
        //hr1.setHeader('username', 'arundhati.mukhopadhyay@sb-allergan.com');
        //hr1.setHeader('password', 'VAE@2017');
        //String jsonString1='{"username":"arundhati.mukhopadhyay@sb-allergan.com","password":"VAE@2017"}';
        //hr1.setBody(jsonString1);
        HttpResponse hres1=h1.send(hr1);
        system.debug(hres1.getBody());*/
        
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        //Engagement__c eng=new Engagement__c(Name='EngOauth000');
        string sessionId='5900BFFD3729D9D230E0457A5D7737CABFFA0455C7CEAFC61C20972F4C3A41A70BB32096EED71952BEB469D1F37A2B2912CBEC13E76D917C3122E4A010EB6729';
        hr.setEndpoint('https://sb-allergan-promomats-sbx.veevavault.com/api/v16.0/query?username=arundhati.mukhopadhyay@sb-allergan.com&password=VAE@2017&auth=5900BFFD3729D9D230E0457A5D7737CABFFA0455C7CEAFC61C20972F4C3A41A70BB32096EED71952BEB469D1F37A2B2912CBEC13E76D917C3122E4A010EB6729&q=select id,name__v from documents');
        //hr.setEndpoint('https://sb-allergan-promomats-sbx.veevavault.com/api/v16.0/query?q=select id,name__v from documents');
        hr.setMethod('GET');
        Blob headerValue = Blob.valueOf('arundhati.mukhopadhyay@sb-allergan.com' + ':' + 'VAE@2017');
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        hr.setHeader('Authorization', authorizationHeader);
        hr.setHeader('Content-Type', 'application/x-www-form-urlenco‌ded');
        hr.setHeader('Content-Length', '0');
        //String jsonString='{"username":"arundhati.mukhopadhyay@sb-allergan.com","password":"VAE@2017","auth":'+'"' +sessionId+'"'+',"q":"select id,name__v from documents"}';
        //hr.setBody(jsonString);
        HttpResponse hres=h.send(hr);
        system.debug(hres.getBody());
        
    }
}