public class PlayWithPickList {
    public static void getRiskTypes()
    {
        List<SelectOption> options = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult =
            Risk__c.RiskType__c.getDescribe();
        Schema.DescribeFieldResult fr=Risk__c.Name.getDescribe();
      
        system.debug(fr);
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }       
        //return options;
        for(SelectOption a :options)
        {
            system.debug(a.getValue());
        }
    }

}