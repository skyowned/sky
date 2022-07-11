global class FSLIUtilities {
    webservice static void deleteFSLI(string fsliId)
    {
        FSLI__c fsli=[Select FSLIId__c,IsDeleted__c From FSLI__c Where FSLIId__c = : fsliId Limit 1];
        fsli.IsDeleted__c=True;
        fsli.Scope__c=False;
        DataBase.update(fsli);
    }
}