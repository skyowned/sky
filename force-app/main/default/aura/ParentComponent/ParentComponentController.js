({
	getValueFromComponentEvent : function(component, event, helper) {
        console.log('i was here');
        var ShowResultValue = event.getParam("Pass_Result");
        console.log('here1 : '+ShowResultValue);
        // set the handler attributes based on event data
        component.set("v.Get_Result", ShowResultValue);
	}
})