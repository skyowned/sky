trigger TaskAdditionMultifuctionTrigger on Multifuction__c (after insert) {
    Multifuction__c mf=[Select Id,Name From Multifuction__c where Id in :Trigger.newMap.keySet() Limit 1];
    Task t=new Task();
    t.WhatId=mf.Id;
    Database.insert(t);
}