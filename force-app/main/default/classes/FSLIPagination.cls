global class FSLIPagination {
    public final FSLI__c fsli{get;set;}
    public string fId{get;set;}

    public FSLIPagination(ApexPages.StandardSetController controller)
    {
        this.fsli=(FSLI__c)controller.getRecord();
        
    }
    
    public List<FSLI__c> getFSLIs()
    {
        List<FSLI__c> lstFsli = [select Id,Name,IsDeleted__c,Scope__c,EngagementId__c from FSLI__c];
        return lstFSLi;
    }
    public PageReference editFSLI()
    {
        system.debug(fId);
        PageReference pageRef = new PageReference('/'+ fId);
        pageRef.setRedirect(false);
        return pageRef;
    }
}