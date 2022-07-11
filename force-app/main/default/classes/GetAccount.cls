public class GetAccount {
    public Id GetAccountId()
    {
       List<FSLI__c> lstAcc=[Select EngagementId__c from FSLI__c Limit 1];
       Id accId;
        string nametest;
        Id e;
       for(FSLI__C A : lstAcc)
       {
           e=A.EngagementId__c;
       }
        return e;
    }
}