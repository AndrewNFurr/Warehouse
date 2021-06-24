public class TestClass {
    public static void grabProducts(){
        List<Product2> product = [SELECT Id, Name, Quantity__c FROM Product2 WHERE Name='Fixed-Base Assembly System'];
        system.debug(product);
    }
    
    public static void createProducts(){
        Product2[] newProduct = new List<Product2>();
        for(Integer i = 0;i<3;i++){
            Product2 p = new Product2(Name= 'Test' + i,Quantity__c= 1);
            newProduct.add(p);
            
        }
        
        system.debug(newProduct);
    }
    
    //this method works fine in anonymous exec window
    public static void updateProducts(String name,Integer quantity){
        Product2 productToUpdate;
        try{
            productToUpdate = [SELECT Id, Name, Quantity__c FROM Product2 WHERE Name=:name];
            productToUpdate.Quantity__c = quantity;
            update productToUpdate;
        } catch(DMLException e) {
            System.debug('Something went wrong: ' + e.getMessage());
        }
        
        Product2 afterUpdate = [SELECT Quantity__c FROM Product2 WHERE Id=:productToUpdate.Id];
        System.assertEquals(quantity,afterUpdate.Quantity__c);
    }
}