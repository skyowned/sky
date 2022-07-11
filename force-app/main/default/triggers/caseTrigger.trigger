trigger caseTrigger on Case (after update) {
    List<Id> lstParentCase=new List<Id>();
    for(Case c: Trigger.New)
    {
        if(c.Status=='Closed')
        {
            lstParentCase.add(c.ParentId);
        }
    }
    List<Case> lstCaseFull=[SELECT Id,status,(select Id,status from Cases) FROM case where Id in:lstParentCase];
    List<Case> lstTobeUpdated=new List<Case>();
    for(Case pc:lstCaseFull)
    {
        integer counter=0;
        for(Case c : pc.Cases)
        {
            if(c.status=='Closed')
              counter++;
        }
        if(counter>=3)
        {
            pc.Status='Closed';
            lstTobeUpdated.add(pc);
        }
    }
    system.debug(lstTobeUpdated);
    update lstTobeUpdated;
}