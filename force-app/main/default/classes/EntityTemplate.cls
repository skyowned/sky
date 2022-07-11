public class EntityTemplate {
    
    public string EmployeeName{get;set;}
    public string EmployeeDesignation{get;set;}
    public Decimal EmployeeSalary{get;set;}
    public string EmployeeType{get;set;}
    public string Template
    {
        get
        {
            return 'EntityTemplate';
        }
    }
    private List<SelectOption> employeeTypeList1;
    public List<SelectOption> EmployeeTypeList
    {
        get
        {
            employeeTypeList1=new List<SelectOption>();
            Schema.DescribeFieldResult dfr=Employee__c.Type__c.getDescribe();
            List<Schema.PicklistEntry> ple=dfr.getPicklistValues();
            for(Schema.PicklistEntry p:ple)
            {
                employeeTypeList1.add(new SelectOption(p.getLabel(),p.getValue()));
            }
            return employeeTypeList1;
        }
    }
    
    public PageReference clickForSave()
    {
        Employee__c e= new Employee__c();
        e.Name=EmployeeName;
        e.Designation__c=EmployeeDesignation;
        e.Salary__c=EmployeeSalary;
        e.Type__c=EmployeeType;
        
        insert e;
        return null;
    }

}