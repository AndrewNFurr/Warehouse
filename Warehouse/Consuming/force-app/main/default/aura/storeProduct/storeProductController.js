({
	clickMakeOrder : function(component, event, helper) {
		let orderProduct = component.get("v.product.Name");
        console.log(orderProduct);
        helper.makeOrder(component, orderProduct);
	}
})