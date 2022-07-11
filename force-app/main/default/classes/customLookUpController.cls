public class customLookUpController {
    @AuraEnabled
    public static List < User > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        ObjectName='User';
        String searchKey = searchKeyWord + '%';
        
        List < User > returnList = new List < User > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 10';
        List < User > lstOfRecords = Database.query(sQuery);
        
        for (User obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}