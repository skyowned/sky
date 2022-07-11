global class Iteration implements Iterator<FSLI__c>{
    List<FSLI__c> lstFSLI;
    Integer i;
    public Iteration()
    {
        lstFSLI=[select Name,Scope__c from FSLI__c];
        i=0;
    }
    public boolean hasNext()
    {
        if(i>=lstFSLI.size())
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    public FSLI__c next()
    {
        if(i == 8)
        {
            return null;
        }
        i++;
        return lstFSLI[i-1];
    }
}