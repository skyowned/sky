public class LwcController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsRelatedToAccount(String accountId) {
        system.debug('accId >> ' + accountId);
        return [SELECT Id, FirstName, LastName, Email, Phone from Contact where AccountId = :accountId];
    }
}