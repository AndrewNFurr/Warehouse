@RestResource(urlMapping='/products/*')
global class ExposeNarwhal {
    @HttpGet
	global static List<Product2> getProducts(){
        List<Product2> products = grabProducts.getProducts();
        Return products;
	}
    @HttpPatch
    global static void changQuantity(String myname, String myQuantity){
        List<Product2> prod = [SELECT Name, Quantity__c FROM Product2 WHERE Name=:myname LIMIT 1];
        //System.debug(myname);
        //System.debug(myQuantity);
        
        prod[0].Quantity__c = Integer.valueOf(myQuantity);
        System.debug(prod[0].Quantity__c );
        update prod;
    }
}