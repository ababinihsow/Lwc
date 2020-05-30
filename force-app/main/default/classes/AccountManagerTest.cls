@isTest
global with sharing class AccountManagerTest {
    @IsTest
    static void methodName(){
        Account acc = new Account();
        acc.Name = 'TestAcc';
        insert acc;

        Contact con1 = new Contact();
        con1.LastName = 'Test1';
        con1.AccountId = acc.Id;
        insert con1;

        Contact con2 = new Contact();
        con2.LastName = 'Test2';
        con2.AccountId = acc.Id;
        insert con2;

        RestRequest req = new RestRequest();
        req.requestURI = 'https://qinweilwc1126-dev-ed.my.salesforce.com/Accounts/'+acc.Id+'/contacts';
        req.httpMethod = 'GET';
        RestContext.request = req;

        AccountManager.getAccount();
    }
}