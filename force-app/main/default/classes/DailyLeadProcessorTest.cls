@isTest
private class DailyLeadProcessorTest {
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
        // DailyLeadProcessor dlp = new DailyLeadProcessor();
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor()); 
        Test.stopTest();
        
    }
}