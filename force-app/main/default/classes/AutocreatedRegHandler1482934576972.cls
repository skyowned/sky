global class AutocreatedRegHandler1482934576972 implements Auth.RegistrationHandler{
    global User createUser(Id portalId, Auth.UserData data){

        User u = [SELECT ID FROM User Where Other_Salesforce_Org_Username__c = : data.username];

        return u;

    }


    global void updateUser(Id userId, Id portalId, Auth.UserData data){

       //No Operation

    }

}