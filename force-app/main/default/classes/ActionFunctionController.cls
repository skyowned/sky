public class ActionFunctionController {
    public Account actObj{get;set;}
    PageReference prf= null;
    public ActionFunctionController(){
        actObj = new Account();
    }
    
    
    public pagereference Saverec(){
        if(actobj.Name !=''){
            insert actobj;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Account '+actobj.Id +' saved');
            ApexPages.addMessage(myMsg);
            
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please Enter Name.');
            ApexPages.addMessage(myMsg);
            
        }
        if(actobj.id !=null){
            
            // Send the user to the detail page for the new account.
            prf = new PageReference('/'+actobj.id);
            //prf.setRedirect(false);
            
        }
        return null;
    }
    
}