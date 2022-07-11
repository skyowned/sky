@RestResource(urlMapping='/MyService/*')
global with sharing class MyFirstService {
    @HttpGet
    global static List<Engagement__c> getListEngagements()
    {
        RestRequest r=RestContext.request;
        string engagementId=r.requestURI.substring(r.requestURI.lastIndexOf('/')+1);
        List<sobject> lst=[Select Name,IsDeleted__c from Engagement__c where Id =: engagementId];
        return lst;
    }
    @HttpPost
    global static Id postListFSLIs()
    {
        RestRequest request = RestContext.request;
        String jSONRequestBody=request.requestBody.toString().trim(); 
        Engagement__c eng=(Engagement__c)JSON.deserializeStrict(jSONRequestBody,Engagement__c.class) ;
        eng.IsDeleted__c=False;
        insert eng;
        return eng.Id;
    }
    
}