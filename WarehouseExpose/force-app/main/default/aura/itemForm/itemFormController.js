({
	handleChoice : function(component, event, helper) {
        let prod = event.getParam("prod");
        component.set("v.updatedProduct", prod);
		
	}
})