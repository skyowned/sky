public class callToolingAPI
{
    public String requestLabel;
    public  List<TestCoverageWrapper> lstTCW{get;set;}
    //@future(callout=true)
    public object getData()
    {
        Continuation con = new Continuation(80);
        con.continuationMethod='processResponse';
        //Query to retrieve covered and uncovered lines of code
        String objectIdQuery = 'SELECT ApexClassOrTrigger.Name, NumLinesCovered, NumLinesUncovered FROM ApexCodeCoverageAggregate';	
        //Create endpoint URL with the current SF instance URL
        String environmentURL = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0/tooling/query/?q=' + EncodingUtil.urlEncode(objectIdQuery, 'UTF-8');
        //Preparing HTTP request
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(environmentURL);
        req.setMethod('GET');
        // Add callout request to continuation
        this.requestLabel = con.addHttpRequest(req);
        // Return the continuation
        return con;    
        
    }
    public object processresponse()
    {
        lstTCW=new List<TestCoverageWrapper>();
        // Http h = new Http();
        //Retrieval of API response
        //string body=h.send(req).getBody();
        //parsing the Json Respose
        HttpResponse response = Continuation.getResponse(this.requestLabel);
        string body=response.getBody();
        Map<String, Object> o = (Map<String, Object>) JSON.deserializeUntyped(body);
        List<Object>  lstObj=(List<Object>)o.get('records');
        List<String> finalString=new List<string>();
        for(Object obj:lstObj)
        {
            Map<String,Object> mapFinal = (Map<String,Object>)obj;
            string objName=(String.valueOf(mapFinal.get('ApexClassOrTrigger')).Split(',')[0]).Split('=')[1];
            Double perCov=Double.ValueOf(mapFinal.get('NumLinesCovered'))==0?0:(Double.ValueOf(mapFinal.get('NumLinesCovered'))/
                                                                                (Double.ValueOf(mapFinal.get('NumLinesUncovered'))+Double.ValueOf(mapFinal.get('NumLinesCovered'))))*100;
            TestCoverageWrapper tcw= new TestCoverageWrapper();
            tcw.Classname=objName;
            tcw.Percentage=perCov;
            if(tcw!=null)
                lstTCW.add(tcw);
            finalString.add(objName+','+Integer.valueOf(perCov));
        }
        system.debug('lstTCW--'+lstTCW);
        return null;
    }
    
    public class TestCoverageWrapper
    {
        public string Classname{get;set;}
        public double Percentage{get;set;}
    }
}