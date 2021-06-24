//Class works with NarwhalWarehouse.cmp
public with sharing class WarehouseController {
	
    @AuraEnabled
    public static List<Product2> getProducts(){
        //Pulling list of Products and their Quantity
        List<Product2> p = [SELECT Id, Name, Quantity__c FROM Product2];
        return p;
    }
    
    @AuraEnabled
    //Will have to tweak this method since its misbehaving
    public static void updateProducts(String product,Integer quantity){
        //Warehouse worker should be able to update the record
        system.debug(product);
        system.debug(quantity);
        List<Product2> p = [SELECT Id, Name, Quantity__c FROM Product2 WHERE Name=:product];
        p[0].Quantity__c += quantity;
        update p[0];
        return;
    }
}