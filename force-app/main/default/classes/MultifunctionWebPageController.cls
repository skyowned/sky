public class MultifunctionWebPageController {

    public Multifuction__c multifuction{get;set;}
    public Id EmployeeId{get;set;}
    public MultifunctionWebPageController()
    {
        //system.debug(String.valueOf(ApexPages.currentPage().getParameters().get('EmployeeId'))+'constructor');
        if(ApexPages.currentPage().getParameters().get('EmployeeId')==null)
            multifuction=new Multifuction__c();
        else
            multifuction=[select name,active__c,EmployeeEmail__c,EmployeeDescription__c,
                          EmployeeJoiningDate__c,EmployeeLocationPreference__c,EmployeePhone__c,EmployeeSalary__c,EmployeeSex__c
                          from Multifuction__c where Id=:ApexPages.currentPage().getParameters().get('EmployeeId')];
            
    }
    public List<Multifuction__c> getmultifuctions()
    {
        List<Multifuction__c> lst=[select Id,Name,Active__c from Multifuction__c];
        return lst;
    }
    @RemoteAction
    public static Database.UpsertResult SaveEmployee(Id mId,string name,integer active
                                                     ,string email,
                                                     string joiningDate,
                                                     string preference,string phone,
                                                     string salary,string sex,
                                                     string description
                                                    )
    { 
        //system.debug(mId);
        Multifuction__c mfObj=new Multifuction__c();
        if(string.valueOf(mId)!='')
        {
            system.debug('I am there ' +mId);
            mfObj.Id=mId; 
        }
        mfObj.Name=name;
        mfObj.Active__c=active==1?true:false;
        mfObj.EmployeeEmail__c=email;
        mfObj.EmployeeJoiningDate__c=Date.parse(joiningDate);
        mfObj.EmployeeLocationPreference__c=preference;
        mfObj.EmployeePhone__c=phone;
        mfObj.EmployeeSalary__c=Decimal.valueOf(salary.contains(',')?salary= salary.replaceall(',',''):salary);
        mfObj.EmployeeSex__c=sex;
        mfObj.EmployeeDescription__c=description;
        system.debug(mfObj);
        
        Database.UpsertResult ur=Database.upsert(mfObj);
        if(ur.isSuccess())
        {
             mfObj=null;
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Data Saved');
            ApexPages.addMessage(m);
        }
        else
        {
          ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.CONFIRM,'VR Error');
            ApexPages.addMessage(m);  
        }
        return ur;
    }
    public PageReference individual()
    {
        //Adding delay for loader
        long now = datetime.now().gettime();
        while(datetime.now().gettime()-now<3000);
        
        if(String.valueOf(EmployeeId)==null || String.valueOf(EmployeeId)=='')
        {
            System.debug('null aak');
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.ERROR,'Null reference');
            ApexPages.addMessage(m);
            return null;
        }
        else
        {
            System.debug(string.valueOf(EmployeeId));
        }
        //Multifuction__c m=[select name,active__c from Multifuction__c where Id=:EmployeeId];
        //PageReference pageRef = new PageReference('https://skyowned-dev-ed--c.ap2.visual.force.com/apex/MultifunctionWebPage?save_new=1&sfdc.override=1&EmployeeId='+ EmployeeId);
        //pageRef.SetRedirect(false);
        //return pageRef;
        multifuction=[select Id,name,active__c,EmployeeEmail__c,EmployeeDescription__c,
                          EmployeeJoiningDate__c,EmployeeLocationPreference__c,EmployeePhone__c,EmployeeSalary__c,EmployeeSex__c
                          from Multifuction__c where Id=:EmployeeId];
        return null;
    }
    public PageReference save()
    {
        if(multifuction!=null)
        {
            system.debug('Not null');
        }
        else
        {
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.ERROR,'Null reference');
            ApexPages.addMessage(m);
            return null;
        }
        try
        {
        Database.UpsertResult ds=Database.upsert(multifuction);
        if(ds.isSuccess())
        {
             multifuction=null;
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Data Saved');
            ApexPages.addMessage(m);
        }
        else
        {
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.ERROR,'Error');
            ApexPages.addMessage(m);
        }
        }
        catch(Exception ex)
        {
            ApexPages.Message m=new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage());
            ApexPages.addMessage(m);

        }
      
        return null;
    }
    

}