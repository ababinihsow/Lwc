@isTest
private class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account acc = new Account();
            acc.Name = 'Test' + String.valueOf(i);
            if (i < 50) {
                acc.BillingState = 'NY';
            } else {
                acc.BillingState = 'CA';
            }
            accList.add(acc);
        }
        insert accList;
    }

    @IsTest
    static void methodName(){
        String stateStr = 'CA';
        Contact con = new Contact();
        con.LastName = 'Test';
        AddPrimaryContact ac = new AddPrimaryContact(con,stateStr);
        Test.startTest();
        System.enqueueJob(ac);

        Test.stopTest();
        System.assertEquals(50, [select count() from Contact where Account.BillingState = :stateStr]);
        
    }
}