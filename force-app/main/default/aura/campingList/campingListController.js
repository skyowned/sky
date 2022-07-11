({
    doInit : function(component, event, helper) {
        var action=component.get("c.getItems");
        action.setCallback(this,function(response)
                           {
                               var state=response.getState();
                               if(state==='SUCCESS')
                               {
                                   component.set("v.items",response.getReturnValue());
                               }
                           });
        $A.enqueueAction(action);
        
    } ,
    handleAddItem: function(component, event, helper) {
        var newCamp = event.getParam("item");
        console.log('tem '+item);
       // helper.createItem(component, newCamp);
        var action = component.get("c.saveItem");
        action.setParams({
            camp : validItem
        });
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newCamp = {'sobjectType': 'Camping_Item__c',
                               'Name': '',
                               'Quantity__c': 0,
                               'Price__c': 0,
                               'Packed__c': false
                              };
                //resetting the Values in the form
                component.set("v.newItem",newCamp);
                
                alert('Record is Created Successfully');
                var campList = component.get("v.items");
                campList.push(a.getReturnValue());
				component.set("v.items", campList);                
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
        //adds the server-side action to the queue        
        $A.enqueueAction(action);
    },

})