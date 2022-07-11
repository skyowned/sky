public with sharing class GetMultiFunctionRecords {
    @AuraEnabled
    public static List<Multifuction__c> GetMFRecords()
    {
        	 List<Multifuction__c> lst=[select Name,
             Active__c,
             EmployeeDescription__c,
             EmployeeEmail__c,
             EmployeeJoiningDate__c,
             EmployeeLocationPreference__c,
             EmployeePhone__c,
             EmployeeSalary__c,
             EmployeeSex__c 
             from Multifuction__c];  
        return lst;
    }
    @AuraEnabled
    public static List<String> getEmployeeSex(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Multifuction__c.EmployeeSex__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug(options);
        return options;
    }
    @AuraEnabled
    public static List<Multifuction__c> createRecord (Multifuction__c candidate){
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                insert candidate;
            }
           return GetMultiFunctionRecords.GetMFRecords();
            
        } catch (Exception ex){
            return new List<Multifuction__c>();
        }
        
    }
}