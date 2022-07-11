public class MyFirstQueueableClass implements Queueable
{
    public void execute(QueueableContext qc)
    {
        FSLI__c f=new FSLI__c(Name='FSLIQueue',Scope__c=false,IsDeleted__c=false);
        insert f;
        system.debug(qc.getJobId());
   
    }
}