trigger AccountTrigger on Account (after update) {
//List<Contact> c=[Select Id,name,testCon__c,accountId,contact.Account.test__c from contact where accountId in :(Trigger.NewMap.KeySet())];
    List<Contact> filteredContact= new List<Contact>();
    List<Account> lstAcc=[select a.Id,a.Name,a.test__c,(select c.Name,c.testCon__c from Contacts c) from Account a
                          where a.Id in :(Trigger.NewMap.KeySet())];
    
    for(Account ac: lstAcc)
    {
        for(Contact co : ac.Contacts)
        {
            co.testCon__c=ac.test__c;
            filteredContact.add(co);
        }
    }

    /*for(Contact con : c)
    {

      con.testCon__c=con.Account.test__c;
        filteredContact.add(con);
    }*/
    update filteredContact;
    
}