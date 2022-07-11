({
	onChange : function(component, event, helper) {
        var get_Value = component.find("select").get("v.value");
        console.log('here : '+get_Value);
        var evt = component.getEvent("loadMyEvent");
        evt.setParams({ "Pass_Result": get_Value});
        evt.fire();
	}
})