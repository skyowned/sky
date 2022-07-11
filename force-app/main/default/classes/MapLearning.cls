global class MapLearning {
    webservice static List<CPMS__c> Learning(String localId){
        
        List<CPMS__c> cpms=new List<CPMS__c>();
        List<CPJunction__c>  cpObj=[select id,Name,Curriculum__c,Program__c from CPJunction__c];
        
        List<PMJunction__c> pmObj=[select id,Name,Program__c,Module__c,Program_Lookedup__c 
                                   from PMJunction__c];
        List<MSJunction__c> msObj=[select id,Name,module__c,Session__c from MSJunction__c];
        for(CPJunction__c cp: cpObj)
        {
            CPMS__c objCPMS=new CPMS__c();
            for(PMJunction__c pm:pmObj)
            {
                if(cp.Program__c==pm.Program__c)
                {  
                    for(MSJunction__c ms:msObj)
                    {
                        if(pm.Module__c==ms.Module__c)
                        {
                            objCPMS.Curriculum__c=cp.Curriculum__c;
                            objCPMS.Program__c=cp.Program__c; 
                            objCPMS.Module__c=pm.Module__c;
                            objCPMS.Session__c=ms.Session__c;
                            boolean present=false;
                            system.debug('--'+objCPMS);
                            for(CPMS__c cpmsOb:cpms)
                            { 
                                
                                if(cpmsOb.Curriculum__c==objCPMS.Curriculum__c &&
                                   cpmsOb.Program__c==objCPMS.Program__c &&
                                   cpmsOb.Module__c==objCPMS.Module__c &&
                                   cpmsOb.Session__c==objCPMS.Session__c)
                                    present=true;
                                
                            }
                            if(!present)
                                cpms.add(objCPMS);
                            system.debug('--'+cpms);
                            objCPMS=new CPMS__c();
                        }   
                    }
                }
            } 
        }
        insert cpms;
        
        return cpms;
    }
}