({
    doInitAction : function(component, event, helper) {
        console.log(component.get("v.recordId"));
        var updateAction = component.get("c.find_AccById");
        updateAction.setParams({ "OppId": component.get("v.recordId") });
        updateAction.setCallback( this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var action = component.get("c.find_AccById");
                console.log(component.get("v.recordId"));
                action.setParams({ "get_accountid": component.get("v.recordId") });
                action.setCallback( this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        component.set("v.ac", response.getReturnValue());
                        console.log(response.getReturnValue());
                    }
                });
                $A.enqueueAction(action);
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(updateAction);
        
    }
})