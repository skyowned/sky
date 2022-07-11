global class AccountUpdateBatch implements Database.Batchable<sobject>
{
//from vscode
    global final String Query;
global final String Entity;
global final String Field;
global final String Value;
    
    global AccountUpdateBatch(String q, String e, String f, String v)
    {
        Query=q; Entity=e; Field=f;Value=v;
    }
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc,List<sobject> lst)
    {
        List<Account> lstAcc=new List<Account>();
        for(sobject ac: lst)
        {
            Account a = (Account)ac;
            if(a.Name=='BatAccount')
            {
               system.debug('I am here');
               a.Industry='Biotechnology';
                //ac.put(Field,Value);
               lstAcc.add(a);
            }
        }
        update lstAcc;
    }
    global void finish(Database.BatchableContext bc)
    {
        {  
                //Send an email to the User after your batch completes  
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();  
String[] toAddresses = new String[] {'aakashghosh00@gmail.com'};  
mail.setToAddresses(toAddresses);  
mail.setSubject('Apex Batch Job is done');  
mail.setPlainTextBody('The batch Apex job processed');  
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  
        }  

    }

}