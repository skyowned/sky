public class MisCompController {
    
    public List<FSLI__C> getFSLIs()
    {
        List<FSLI__c> fs=[Select name from FSLI__c];
        return fs;
    }

}