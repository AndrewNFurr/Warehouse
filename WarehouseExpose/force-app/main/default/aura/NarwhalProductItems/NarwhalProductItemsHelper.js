({
	updateProduct : function (component,prod){ 
		let productChoice = $A.get("e.c:choseProduct");
        productChoice.setParams({"prod":prod});
        productChoice.fire();       
    }
})