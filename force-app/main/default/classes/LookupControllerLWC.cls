public with sharing class LookupControllerLWC {
    public LookupControllerLWC() {

    }
    @AuraEnabled(cacheable=true)
    public static List<sObject> findRecords(string objectName,
    string fieldApiName,
    string searchValue){
        string key='%'+searchValue+'%';
        string query='Select Id, '+fieldApiName+' from '+objectName+' where '+fieldAPIName+' Like : key';
        System.debug('query is '+query);
        list<sObject> sobjectList=Database.Query(query);
        return sobjectList;
    }
}