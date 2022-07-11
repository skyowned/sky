trigger DescopeFsliTrigger on FSLI__c (after update) {
    List<FsliRisk__c> listFsliRisk=new List<FsliRisk__c>();
    List<Risk__c> listRiskDeleted=new List<Risk__c>();
    List<Evidence__c> listEvidenceDeleted=new List<Evidence__c>();
    List<Association__c> listAssociation=new List<Association__c>();
    Set<string> fsliRiskId=new Set<string>();
    Set<string> setRiskId=new Set<string>();
        List<FSLI__c> listFsli=[Select y.Name,y.Scope__c,(Select x.Name, x.RiskId__c,x.FSLIId__c,x.IsDeleted__c From FsliRisk__r x)
                            From FSLI__c y
                            Where y.Scope__c=False];
    
    for(FSLI__c fsli :listFsli)
    {
        for(FsliRisk__c fsliRisk : fsli.FsliRisk__r)
        {
            if(fsliRisk.Isdeleted__c!=True)
            {
                fsliRisk.Isdeleted__c=True;
                listFsliRisk.add(fsliRisk);
                fsliRiskId.Add(fsliRisk.Name);
            }
        }
    }
    Database.update(listFsliRisk);
    List<Risk__c> listRisk=[Select y.RiskId__c,y.IsDeleted__c ,
                            (Select x.Name,x.RiskId__c,x.FsliId__c From FsliRisk__r x Where x.Name in : fsliRiskId)
                            From Risk__c y
                            ];
    for(Risk__c risk : listRisk)
    {
        if(risk.Isdeleted__c!=True)
        {
            risk.IsDeleted__c=True;
            listRiskDeleted.add(risk);
            setRiskId.add(risk.RiskId__c);
        }
    }
    Database.update(listRiskDeleted); 
    
    List<Risk__c> listRiskAssociation=[Select y.RiskId__c,y.IsDeleted__c ,
                            (Select z.Name,z.RiskId__c,z.EvidenceId__c,z.IsDeleted__c From Associations__r z)
                            From Risk__c y
                            Where y.RiskId__c in : setRiskId
                            ];
    for(Risk__c riskAss :listRiskAssociation)
    {
        for(Association__c ass : riskAss.Associations__r)
        {
            if(ass.Isdeleted__c!=True)
            {
                ass.Isdeleted__c=True;
                listAssociation.add(ass);
                setRiskId.Add(ass.Name);
            }
        }
    }
    Database.update(listAssociation);
    
    //--------------------------------------
    List<Evidence__c> listEvidence=[Select y.EvidenceId__c,y.IsDeleted__c ,
                            (Select x.Name,x.RiskId__c,x.EvidenceId__c From Associations__r x Where x.Name in : setRiskId)
                            From Evidence__c y
                            ];
    for(Evidence__c evidence : listEvidence)
    {
        if(evidence.Isdeleted__c!=True)
        {
            evidence.IsDeleted__c=True;
            listEvidenceDeleted.add(evidence);
        }
    }
    Database.update(listEvidenceDeleted); 
}