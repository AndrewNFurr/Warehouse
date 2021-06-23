public class CallTest {
    public static string getInfo(){
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://curious-narwhal.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        String CLIENT_ID = '3MVG9cHH2bfKACZZrke7OJtyhDCynzJW8b7Sjq1XK5qdGoAOq6nJVTzcQz8EebTxnnjW6cVDVqr6pDTWVWsjN';
        String CLIENT_SECRET = '683E0CE28BB896F20CC896924CB17E82B10DC5A453A4C22B37623C746E5E4E9A';
        String USERNAME = 'oleandy1221@curious-narwhal-1qky2o.com';
        String PASSWORD = 'CuriousNarwhal1';
        req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + 
                    '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        Http http=new Http();
        HttpResponse res=new HttpResponse();
        res=http.send(req);
        System.debug('response-->: '+res.getBody());

        return null;
    }
}