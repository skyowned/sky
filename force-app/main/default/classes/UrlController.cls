public class UrlController {
    public string url{get;set;}
    public UrlController()
    {
        PageReference pageRef = new PageReference('https://skyowned-dev-ed.my.salesforce.com/001/o');
        url=String.valueof(pageRef);
    }
}