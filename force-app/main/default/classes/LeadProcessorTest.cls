@isTest
private class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> leList = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead le = new Lead();
            le.LastName = 'Test' + String.valueOf(i);
            le.Company = 'TestCompany' + String.valueOf(i);
            leList.add(le);
        }
        insert leList;
    }
    @IsTest
    static void methodName(){
        
        Test.startTest();
        LeadProcessor lpObj = new LeadProcessor();
        Id objId = Database.executeBatch(lpObj);
        Test.stopTest();
        
    }
}