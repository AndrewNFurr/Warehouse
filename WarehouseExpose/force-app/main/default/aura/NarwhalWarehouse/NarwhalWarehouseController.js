({
	// Load items from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getProducts");
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.products", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})