public class testPalitController {
    public List<WrapperAcc> wrapperLst {get; set;}
    public List<Account> accSearch{get;set;}
    
    public testPalitController(){
        wrapperLst=new List<WrapperAcc>();
        accSearch =[select id,name,Phone,(Select id,Department,Birthdate from Contacts)from Account];
        for(Account accRec : accSearch) {
            system.debug('--check-- '+accRec.contacts);
            WrapperAcc w = new WrapperAcc(accRec.Name,accRec.Phone,!(accRec.contacts.isEmpty())?accRec.contacts[0].Department:'',
                                          !(accRec.contacts.isEmpty())?String.ValueOf(accRec.contacts[0].Birthdate):'');
            wrapperLst.add(w);
            /*for (Contact gpa : accRec.contacts) {
                w.addContact(gpa);
            }*/
        }
    }
    
    public class WrapperAcc {
        /*public Account acc {get; private set;}
        public List<Contact> contactList {get; private set;}
        WrapperAcc(Account acc) {
            this.acc = acc;
            this.contactList = new List<Contact>();
        }
        void addContact(Contact gpa) {
            contactList.add(gpa);
        }*/
        public string Name{get;set;}
        public string Phone{get;set;}
        public string Department{get;set;}
        public String Birthdate{get;set;}
        WrapperAcc(string wrapName,string wrapPhone,string wrapDepartment,String wrapBirthdate) {
            this.Name = wrapName;
            this.Phone = wrapPhone;
            this.Department = wrapDepartment;
            this.Birthdate = wrapBirthdate;
        }
    }
}