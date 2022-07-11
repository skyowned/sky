public class FileUploader 
{
    
    public PageReference fileAccess() {
        return null;
    }
    
    
    public FileUploader(){
        
    }
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
        List<FSLI__c> fsliUpload;
    static final Id engId='a062800000BzN7FAAV';
    
    public Pagereference ReadFile()
    {
        
        system.debug(engId);
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        fsliUpload = new List<FSLI__c>();
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
                inputvalues = filelines[i].split(',');
            
            FSLI__c a = new FSLI__c();
            a.Name = inputvalues[0];
            a.Scope__c = Boolean.valueOf(inputvalues[1]);       
            a.IsDeleted__c = Boolean.valueOf(inputvalues[2]);
            a.EngagementId__c = engId;
            
            fsliUpload.add(a);
        }
        try{
        Database.insert(fsliUpload);
    }
    catch (Exception ex)
    {
        ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
        ApexPages.addMessage(errormsg);
    }    
    return null;
}

public List<FSLI__c> getuploadedFSLIs()
{
    if (fsliUpload!= NULL)
        if (fsliUpload.size() > 0)
        return fsliUpload;
    else
        return null;                    
    else
        return null;
}


}