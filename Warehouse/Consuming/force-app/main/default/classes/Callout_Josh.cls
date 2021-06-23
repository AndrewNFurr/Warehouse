public class Callout_Josh {
    public static void callout() {
        HttpRequest req = new HttpRequest();
		req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        String CLIENT_ID = '3MVG9cHH2bfKACZZrke7OJtyhDKOIQ0BXIBgmAlGwSjpeQeje2kvI36Pwk473tgI1tNJZdXZ8WFc2NFwxAcSk';
		String CLIENT_SECRET = '18C0B7423E0930BC426DA1EF5293E01EDFB2D4A1FF738ED3D8A80FDD2E1D0650';
		String USERNAME = 'oleandy1221@curious-narwhal-1qky2o.com';
		String PASSWORD = 'CuriousNarwhal1';
		req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        Http http = new Http();
        HttpResponse res=new HttpResponse();
        res=http.send(req);
        System.debug('response-->: '+res.getBody());
        Oauth objAuthInfo=(Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        if(objAuthInfo.access_token!=null){
        	HttpRequest req1=new HttpRequest();
			req1.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.my.salesforce.com/services/apexrest/test/');
            req1.setMethod('GET');
            req1.setHeader('Authorization','Bearer '+objAuthInfo.access_token);
            Http http1=new Http();
            HttpResponse res1=new HttpResponse();
            res1=http1.send(req1);
            System.debug('Res-->: '+res1.getBody());
        }
    }
    
    public static void getProduct(){
        HttpRequest req = new HttpRequest();
		req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        String CLIENT_ID = '3MVG9cHH2bfKACZZrke7OJtyhDKOIQ0BXIBgmAlGwSjpeQeje2kvI36Pwk473tgI1tNJZdXZ8WFc2NFwxAcSk';
		String CLIENT_SECRET = '18C0B7423E0930BC426DA1EF5293E01EDFB2D4A1FF738ED3D8A80FDD2E1D0650';
		String USERNAME = 'oleandy1221@curious-narwhal-1qky2o.com';
		String PASSWORD = 'CuriousNarwhal1';
		req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        Http http = new Http();
        HttpResponse res=new HttpResponse();
        res=http.send(req);
        //System.debug('response-->: '+res.getBody());
        Oauth objAuthInfo=(Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        if(objAuthInfo.access_token!=null){
        	HttpRequest req1=new HttpRequest();
			req1.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.my.salesforce.com/services/apexrest/products/');
            req1.setMethod('GET');
            req1.setHeader('Authorization','Bearer '+objAuthInfo.access_token);
            Http http1=new Http();
            HttpResponse res1=new HttpResponse();
            res1=http1.send(req1);
            if(res1.getStatusCode() == 200){
                //System.debug('Res-->: '+res1.getBody().);
                 //put info into a list of product
                List<Object> prod = (List<Object>) JSON.deserializeUntyped(res1.getBody());
                List<Product2> temp = new List<Product2>();
                for(Object p:prod){
                    Map<String,Object> data = (Map<String,Object>)p;
					
                    Product2 cur = new Product2(Name=String.valueOf(data.get('Name')), Quantity__c=Integer.valueOf(data.get('Quantity__c')), IsActive=true);
                    
                    temp.add(cur);
                }
                //sort out which record to update and which to insert
                List<Product2> addList = new List<Product2>();
                List<Product2> myList = [SELECT Name, Quantity__c FROM Product2];
                List<Product2> updateList = new List<Product2>();
				for(Product2 p:temp){
                    Boolean isExist = false;
                    Id idToUpdate;
                	for(Product2 myP:myList){
                        //check if the product is already in the store database
                        if(p.Name == myP.name){
                            isExist = true;
                            idToUpdate = myP.Id;
                        }
                    }
                    //the record is not on the database, put it to the add list
                    if(isExist!=true){
                        addList.add(p);
                    }//the record is on the database, put it into update list
                    else{
                        Product2 addMe = new Product2(Name=p.Name, Quantity__c=p.Quantity__c, Id=idToUpdate);
                        updateList.add(addMe);
                    }
                }
                
                //if these lists are not empty, execute dml
                if(addList.size()>0){
                    insert addList;
                }
                if(updateList.size()>0){
                    update updateList;
                }
            }
            
        }
    }
}