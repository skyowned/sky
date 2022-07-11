public class ConsumeRest {
    public static  void ConsumeGet()
    {
        //saved from mavensmate
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        string engID='a062800000BzN7FAAV';
        hr.setEndpoint('https://ap2.salesforce.com/services/apexrest/MyService/'+engID);
        hr.setMethod('GET');
        hr.setHeader('Authorization','Bearer '+ UserInfo.getSessionId());
        
        HttpResponse hres=h.send(hr);
        system.debug(hres.getBody());
        
    }
    public static  void ConsumePost()
    {
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        Engagement__c eng=new Engagement__c(Name='Eng123');
        hr.setEndpoint('https://ap2.salesforce.com/services/apexrest/MyService');
        hr.setMethod('POST');
        hr.setHeader('Authorization','Bearer '+ UserInfo.getSessionId());
        hr.setHeader('Content-Type', 'application/json');
        hr.setHeader('Content-Length', '0');
        
        hr.setBody(JSON.serialize(eng));
        HttpResponse hres=h.send(hr);
        system.debug(hres.getBody());
        
    }
    public static  void ConsumePostDifferent()
    {
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        Engagement__c eng=new Engagement__c(Name='EngOauth123');
        hr.setEndpoint('callout:My_Named_Credential/services/apexrest/MyService');
        hr.setMethod('POST');
        hr.setHeader('Content-Type', 'application/json');
        hr.setHeader('Content-Length', '0');
        hr.setBody(JSON.serialize(eng));
        HttpResponse hres=h.send(hr);
        system.debug(hres.getBody());
        
    }
    public static  void ConsumePostWithUnamePass()
    {
        HttpRequest hr=new HttpRequest();
        Http h=new Http();
        Engagement__c eng=new Engagement__c(Name='EngOauth000');
        hr.setEndpoint('https://ap2.salesforce.com/services/apexrest/MyService');
        hr.setMethod('POST');
        String username = 'aakashghosh@gmail.com';
        String password = 'welcome@1';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        hr.setHeader('Authorization', authorizationHeader);
        //hr.setHeader('Content-Type', 'application/json');
        //hr.setHeader('Content-Length', '0');
        hr.setBody(JSON.serialize(eng));
        HttpResponse hres=h.send(hr);
        system.debug(hres.getBody());
        
    }
    
}