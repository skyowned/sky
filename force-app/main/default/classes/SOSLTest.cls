public class SOSLTest {
    public void test()
    {
        List<List<SObject>> searchList = [FIND 'Laptop*' IN ALL FIELDS RETURNING Merchandise__c (Id, Name)];
        Merchandise__c[] merList = ((List<Merchandise__c>)searchList[0]);
        //Invoice_Statement__c[] invList = ((List<Invoice_Statement__c>)searchList[1]);
        System.debug('Found ' + merList.size() + ' merchandise items.');

    }
}