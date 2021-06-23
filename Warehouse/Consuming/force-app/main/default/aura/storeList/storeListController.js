({
	doInit : function(component, event, helper) {
		let action = component.get("c.getProducts");
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
				 component.set("v.products", response.getReturnValue());
            } else {
                console.log('Error receiving Products')
            }
        });
        $A.enqueueAction(action);
	}
})