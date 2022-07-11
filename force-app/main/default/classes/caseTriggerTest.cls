@isTest
public class caseTriggerTest {

    public static testmethod void TestCaseUpdate()
    {
        List<Case> lst=new List<Case>();
        Case pc=new Case(status='open');
        insert pc;
        Case c1=new Case(status='open',parent=pc);
        Case c2=new Case(status='open',parent=pc);
        Case c3=new Case(status='open',parent=pc);
        //lst.add(pc);
        lst.add(c1);
        lst.add(c2);
        lst.add(c3);
        insert lst;
        List<Id> lstcc=new List<Id>();
        lstcc.add(c1.Id);
        lstcc.add(c2.Id);
        lstcc.add(c3.Id);
        
        List<Case> lstccdet=[Select Id,status from Case where Id in:lstcc];
        List<Case> up=new List<Case>();
        for(Case cdet : lstccdet)
        {
            cdet.Status='Closed';
            up.add(cdet);
        }
        system.debug(up);
        update up;
        Case pcDet=[Select Id,status from Case where Id =:pc.Id];
        system.debug(pcDet);
        system.assertEquals('Closed', pcDet.Status);
        
    }
}