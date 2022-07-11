public class TestApexAccountContact {

   public static void TestAccCon()
   {
       List<Account> acc=[select Name,(select Name from Contacts) from Account];
       for(Account ac : acc)
       {
           for(Contact c : ac.Contacts)
           {
               System.debug(ac.Name+'-'+ c.Name);
           }
       }
   }
    
}