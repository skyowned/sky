public class MiscellaneousCustomController {

    public FSLI__c f{get;set;}
    public MiscellaneousCustomController()
    {
        Id i=ApexPages.currentPage().getParameters().get('id');
        f=[Select Name,IsDeleted__c,Scope__c from FSLI__c where Id=:i Limit 1];
    }
    public PageReference save()
    {
        try{
        upsert f;
        }
        catch(DmlException ex)
        {
            ApexPages.addMessages(ex);
        }
       //PageReference ref=new PageReference('/apex/Miscellaneous');
       PageReference ref=Page.Miscellaneous;
//        ref.setRedirect(false);
        return ref;
        
    }
    
}