public class AccountFormByIDController {
    @AuraEnabled
    public static Opportunity find_AccById(Id get_accountid) {
        if(get_accountid != null ) {
            return [SELECT Id, Source__c, Target__c, Target_Formula__c from Opportunity where ID = :get_accountid];
        }  
        return null;
    } 
    public static void updateRecord(Id OppId) {
        List<Opportunity> lstOpp= new List<Opportunity>();
        lstOpp=[select id,Source__c, Target__c, Target_Formula__c from Opportunity where id = : OppId Limit 1];
        if(lstOpp.size()>0)
        {
            if(lstOpp[0].Source__c!=lstOpp[0].Target__c)
                lstOpp[0].Target__c=lstOpp[0].Source__c;
        }
        try
        {
            update lstOpp;
        }
        catch(exception ex)
        {
            
        }
    }
}