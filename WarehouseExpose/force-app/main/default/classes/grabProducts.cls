public class grabProducts {
    
    public static list<Product2> getProducts(){
        
        list<Product2> prodList = [SELECT Quantity__c, Name FROM Product2];
   	
        return prodList;
    
    }
}