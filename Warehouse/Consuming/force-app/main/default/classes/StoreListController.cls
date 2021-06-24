public class StoreListController {
	@AuraEnabled
    public static List<Product2> getProducts() {
        return [
            SELECT Id, Name, Quantity__c
            FROM Product2
        ];
    }
    
    @AuraEnabled
    public static Decimal setProduct(String prodName, Integer quantity){
        system.debug(prodName);
        system.debug(quantity);
        List<Product2> updatedProduct = [
            SELECT Id, Name, Quantity__c
            FROM Product2
            WHERE Name =:prodName
            LIMIt 1
        ];
        updatedProduct[0].Quantity__c += quantity;
        system.debug(updatedProduct[0]);
        
        Product2 changed = Callout_Josh.getProduct(updatedProduct[0].Name);
        changed.Quantity__c -= quantity;
        system.debug(changed);
        Callout_Josh.setProduct(changed);
        
        update updatedProduct[0];
        return updatedProduct[0].Quantity__c;
}
}