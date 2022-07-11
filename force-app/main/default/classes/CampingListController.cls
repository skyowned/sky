public class CampingListController {
    @AuraEnabled
	public static List<Camping_Item__c> getItems()
    {
       list<Camping_Item__c> lstci=[select Name,Packed__c,Price__c,Quantity__c from Camping_Item__c]; 
        return lstci;
    }
    @AuraEnabled
    public static Camping_Item__c saveItem (Camping_Item__c camp)
    {
        system.debug('Camping_Item__c'+camp);
        if(camp != null){
            upsert  camp;
        }
        return camp;
    }
}