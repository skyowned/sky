public with sharing class CreateCandidateRecord {

    /**
   * Create a new candidate Record
   *
   * @param Candidate__c candidate  candidate record to be inserted
   * 
   */
    @AuraEnabled
    public static void createRecord (Employee__c candidate){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                insert candidate;
            }
            
        } catch (Exception ex){
            
        }
        
    } 
    @AuraEnabled
    public static List<String> getEmployeeType(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Employee__c.Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        
        return options;
    }
}