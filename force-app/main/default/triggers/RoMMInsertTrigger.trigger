trigger RoMMInsertTrigger on FSLI__c (after insert) {
    FSLI__c fSLI=[select FSLIId__c,Name from FSLI__c where Id in : Trigger.newMap.keySet() Limit 1];
    Risk__c r=new Risk__c();
    r.Name='Risk6';
    r.RiskType__c='AssumedRoMM';
    r.IsDeleted__c=False;
    r.DependentPL__c='A';
    Database.Insert(r);
    
    InsertEntities.InsEntities(r);
    
    FsliRisk__c fr=new FsliRisk__c();
    fr.FSLIId__c=fSLI.Id;
    fr.RiskId__c=r.Id;
    fr.IsDeleted__c=False;
    
    Database.Insert(fr);
}