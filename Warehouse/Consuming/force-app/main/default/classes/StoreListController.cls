public class StoreListController {
	@AuraEnabled
    public static List<Product2> getProducts() {
        return [
            SELECT Id, Name, Quantity__c
            FROM Product2
        ];
    }
}