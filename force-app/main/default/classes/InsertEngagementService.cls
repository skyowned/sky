global class InsertEngagementService {
    webservice static Id InsertEngagement(String engName,boolean isdeleted)
    {
        
        Engagement__c eng=new Engagement__c(Name=engName,IsDeleted__c=isdeleted);
        insert eng;
            
        return eng.Id;
            
    }
}