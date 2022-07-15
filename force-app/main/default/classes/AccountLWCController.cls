public class AccountLWCController {
    @AuraEnabled(cacheable=true)
   public static List<Account> getAccountList() {
       return [SELECT Id, Name FROM Account];
   }
   /*@AuraEnabled
   public static List<Contact> getContacts(String accountId){
    system.debug('accountId--'+accountId);
       return [Select Id,FirstName,LastName,Email,Phone from Contact where AccountId = :accountId];
        
   } */
   @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String accountId) {
        system.debug('accId >> ' + accountId);
        return [SELECT Id, FirstName, LastName, Email, Phone from Contact where AccountId = :accountId];
    }
}