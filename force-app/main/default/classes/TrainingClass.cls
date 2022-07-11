public class TrainingClass {

	List<Case> lstCases;  
    public TrainingClass()
    {
        lstCases=[select Id from case];
    }
    public void soqlForLoop()
    {
        for(case scase: [select Id from case])
        {
            
        }
    }
    public void listForLoop()
    {
        for(case lcase: lstCases)
        {
            
        }
    }

}