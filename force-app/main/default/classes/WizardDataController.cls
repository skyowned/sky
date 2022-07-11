global with sharing class WizardDataController {
    
    private FSLI__c fsli{get;set;}
    private Risk__c risk{get;set;}
    private Evidence__c evidence{get;set;}
    private FsliRisk__c fsliRisk{get;set;}
    private Association__c association{get;set;}
    public WizardDataController()
    {
        fsli=new FSLI__c();
        risk=new Risk__c();
        evidence=new Evidence__c();
        fsliRisk=new FsliRisk__c();
        association=new Association__c();
    }
    @RemoteAction
    global static string getEngagementName()
    {
        Engagement__c e=[select Name from Engagement__c limit 1];
        system.debug(e.Name);
        return e.Name;
    }
    public FSLI__c getFsli() {
        return fsli;
    }
    public Risk__c getRisk() {
        return risk;
    }
    public Evidence__c getEvidence() {
        return evidence;
    }
    
    public PageReference redirectToRisk(){
        if(fsli != null){
            PageReference pageRef = new PageReference('/apex/AddRiskView');
            //pageRef.setRedirect(false);
            //return Page.AddRiskView;
            return pageRef;
        }
        else{
            return null;
        }
    }
    public PageReference redirectToEGA(){
        if(risk != null){
            PageReference pageRef = new PageReference('/apex/AddEGAView');
            return pageRef;
        }
        else{
            return null;
        }
    }
    public void save(){
        try{
        if(fsli!=null)
        {
            Database.insert(fsli);
        }
        
        
        if(risk!=null)
        {
            Database.insert(risk);
        }
        fsliRisk.FSLIId__c=fsli.Id;
        fsliRisk.RiskId__c=risk.Id;
        //fsliRisk.IsDeleted=False;
        Database.insert(fsliRisk);
        if(Evidence!=null)
        {
            Database.insert(Evidence);
        }
        association.RiskId__c=risk.Id;
        association.EvidenceId__c=evidence.Id;
        Database.insert(association);
            //return new PageReference('/apex/FSLIWizardView');
        }
        catch(DMLException ex)
        {
            throw ex;
        }
        
    }
    
    
}