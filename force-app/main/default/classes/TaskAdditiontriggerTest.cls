@isTest
public class TaskAdditiontriggerTest {
    @isTest
    public static void testInsertTask()
    {
        Multifuction__c m=new Multifuction__c(Name='Test');
        insert m;
        Task t=[Select WhatId from Task where whatId =:m.Id];
        system.assertEquals(m.Id, t.WhatId);
    }
}