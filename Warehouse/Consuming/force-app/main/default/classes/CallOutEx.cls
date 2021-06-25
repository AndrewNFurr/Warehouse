public class CallOutEx {
    public static string getInfo(){
        HttpRequest req = new HttpRequest();
        String query='select+Id,Name+from+Account';
        req.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.lightning.force.com/test');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse resp = http.send(req);
        system.debug('Body:'+resp);
        
        
        
        
       // Http http = new Http();
        //HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.lightning.force.com/test');
        //https://yourinstance.salesforce.com/services/apexrest/apindpoint
        
       // request.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.my.salesforce.com/services/apexrest/test');
        
        /*request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
           System.debug(response.getBody());
        }
        else{
            System.debug('This not working');
        }*/
        
        return null;
    }
	
}