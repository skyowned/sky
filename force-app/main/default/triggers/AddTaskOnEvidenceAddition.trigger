trigger AddTaskOnEvidenceAddition on Evidence__c (after insert) {
    Evidence__c evidence=[Select EvidenceId__c,Name From Evidence__c where Id in :Trigger.newMap.keySet() Limit 1];
    Task t=new Task();
    t.OwnerId = UserInfo.getUserId();
    t.WhatId=evidence.Id;
    Database.insert(t);
}