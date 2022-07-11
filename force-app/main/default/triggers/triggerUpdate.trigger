trigger triggerUpdate on Student__c (after update) {
List<Student__c> lst=[select name,StudentDeleted__c,(select name,MasterDeleted__c from Masters__r)
                     from Student__c where StudentDeleted__c=True];
    List<Master__c> lstMaster=new List<Master__c>();
      for(Student__c stud : lst)
      {
          for(Master__c master : stud.Masters__r)
          {
              if(master.MasterDeleted__c!=true)
              {
                  master.MasterDeleted__c=True;
                  lstMaster.add(master);
              }
          }
      }
    Database.update(lstMaster);
}