public class OpportunitySKUController {
    public OpportunitySKUController(ApexPages.StandardController controller)
    {    
    }
    @RemoteAction
    public static void SaveSKU(Id oppId,string Name,integer SKUNumber)
    {
        SKU__c s=new SKU__c();
        s.Name=Name;
        s.Opportunity__c=oppId;
        s.SKU_Number__c=Double.ValueOf(SKUNumber);
        insert s;
    }
}