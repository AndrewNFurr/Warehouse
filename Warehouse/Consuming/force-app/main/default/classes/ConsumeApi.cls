public class ConsumeApi {
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
			req1.setEndpoint('https://curious-narwhal-1qky2o-dev-ed.my.salesforce.com/test/');
            req1.setMethod('GET');
            req1.setHeader('Authorization','Bearer '+objAuthInfo.access_token);
            Http http1=new Http();
            HttpResponse res1=new HttpResponse();
            res1=http1.send(req1);
            System.debug('Res-->: '+res1.getBody());
        }
    }
}