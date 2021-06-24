({
	clickChoseProduct : function(component, event, helper){
		event.preventDefault();
        let prod = component.get("v.product");
        helper.updateProduct(component,prod); 
	}   
})