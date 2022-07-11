public class fsliextensions {
    public FSLI__c fsli{get;set;}
    string fsliId{get;set;}
    string m;
    private ApexPages.StandardController stdcontroller{get;set;}
    public fsliextensions(ApexPages.StandardController stdcontroller)
    {
        this.stdcontroller=stdcontroller;
        fsli=(FSLI__c)stdcontroller.getRecord();
    }
    public string getLucky()
    {
        m='I am lucky';
        return m;
    }
    public PageReference editFSLI()
    {
        system.debug(fsliId);
        PageReference pageRef = new PageReference('/apex/' + fsliId);
        Id id = System.currentPageReference().getParameters().get('id');       
        pageRef.getParameters().put('id',id);
        pageRef.setRedirect(true);
        return pageRef;
    }
    public List<FSLI__c> getFSLIs()
    {
        String[] toAddresses = new String[]{'aakashghosh00@gmail.com'};
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject( 'subject' );
        email.setToAddresses(toAddresses);
        email.setPlainTextBody( 'Hi ,I am from VF...' );
        // Sends the email
        Messaging.SendEmailResult [] r =Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
        List<FSLI__c> lst=[Select Id,Name,Scope__c from FSLI__c];
        return lst;
    }
    
}