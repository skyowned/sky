({
    loadMis : function(cmp) {
        console.log('I am here2');
        var action=cmp.get("c.GetMFRecords");
        console.log('I am here2'+action);
        action.setCallback(this,function(response)
                           {
                               var state=response.getState();
                               if(state==='SUCCESS')
                               {
                                   cmp.set("v.mf",response.getReturnValue());
                               }
                           });
        $A.enqueueAction(action);
    }
})