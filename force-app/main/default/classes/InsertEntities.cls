public class InsertEntities {
    
    public static void InsEntities(Risk__c e)
    {
        Task t=new Task();
        t.WhatId=e.Id;
        Database.insert(t);
    }
}