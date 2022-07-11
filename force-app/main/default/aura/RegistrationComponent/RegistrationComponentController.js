({
    init : function(component, event, helper) {
        var action=component.get("c.getEmployeeSex");
        var inputsel=component.find("InputSelectDynamic");
        var opts=[];
        action.setCallback(this,function(a)
                           {
                               for(var i=0;i< a.getReturnValue().length;i++){
                                   opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
                               }
                               inputsel.set("v.options", opts);
                           });
        $A.enqueueAction(action); 
        helper.loadMis(component);
        
    },
    create : function(component, event, helper) {
        console.log('Create record');
        
        //getting the candidate information
        var candidate = component.get("v.multi");
        
        //Validation
        if($A.util.isEmpty(candidate.Name) || $A.util.isUndefined(candidate.Name)){
            alert('Name is Required');
            return;
        }            
        if($A.util.isEmpty(candidate.Designation__c) || $A.util.isUndefined(candidate.Designation__c)){
            alert('Designation is Rqquired');
            return;
        }
        if($A.util.isEmpty(candidate.Salary__c) || $A.util.isUndefined(candidate.Salary__c)){
            alert('Salary is Required');
            return;
        }
        
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            candidate : candidate
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newCandidate = {'sobjectType': 'Multifuction__c',
                                    'Name': '',
                                    'Designation__c': '',
                                    'Salary__c': '', 
                                    'EmployeeSex__c': ''
                                   };
                //resetting the Values in the form
                component.set("v.multi",newCandidate);
                alert('Record is Created Successfully');
                component.set("v.mf",a.getReturnValue());
                component.set("v.suc",true);
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
        //adds the server-side action to the queue        
        $A.enqueueAction(action);
        
    }
    
})