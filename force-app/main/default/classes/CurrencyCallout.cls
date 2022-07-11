public class CurrencyCallout {
    public static string singleJsonString='';
    @future(callout=true)
    public static void retrieveLatestRate(string sessionId)
    {
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');
        String url = 'http://www.apilayer.net/api/live?access_key=910fea6fe53ae91ca9bdc424c661ae32';
        req.setEndpoint(url);
        HTTPResponse resp = http.send(req);
        JSON2Apex json2ApexResp = (JSON2Apex)JSON.deserialize(resp.getBody(),JSON2Apex.class);
        updateCurrency(JSON2Apex.convertToMap(json2ApexResp),sessionId);
    }
    public static void updateCurrency(Map<string,Double> mStr,String sessionId)
    {
        for (CurrencyType ct:[SELECT Id,ConversionRate,IsoCode FROM CurrencyType])
        {
            for(String s:mStr.KeySet())
            {
                if(s==ct.IsoCode)
                    convertToJson(ct.Id,mstr.get(s));
            }
        }
        updateCurrThruRest('{"batchRequests" : ['+singleJsonString.subString(0,singleJsonString.Length()-1)+']}',sessionId);
        
    }
    public static string convertToJson(string currId,Double convRate )
    {
        singleJsonString=singleJsonString+'{ "method" : "PATCH", "url":"v43.0/sobjects/CurrencyType/'+currId+'", "richInput" : { "ConversionRate" : '+convRate+ '}},';
        return singleJsonString;
    }
    public static void updateCurrThruRest(string jsonBody,string sessionId)
    {

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0/composite/batch');
        req.setBody(jsonBody);
        req.setHeader('Authorization', 'OAuth ' + sessionId);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        HttpResponse res = h.send(req);
    }

}