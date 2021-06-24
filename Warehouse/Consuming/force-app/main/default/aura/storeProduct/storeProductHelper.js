({
	makeOrder : function(component, product) {
		let action = component.get("c.setProduct");
        action.setParams({"prodName" : product, "quantity" : 1});
        action.setCallback(this, function(response) {
            if (response.getState === "SUCCESS") {
                component.set("v.product.Quantity__c", response.getReturnValue())
                console.log("v.product.Quantity__c");
            } else {
                console.log("updating product issue");
            }
        });
        $A.enqueueAction(action);
	}
})