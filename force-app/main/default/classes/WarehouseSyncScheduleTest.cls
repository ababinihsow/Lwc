@isTest
private class WarehouseSyncScheduleTest {
    @IsTest
    static void methodName(){
        
        Test.startTest();
        String sch = '0 0 1 * * ?';
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        String jobId = System.schedule('WarehouseSyncScheduleTest', sch, new WarehouseSyncSchedule());
        
        Test.stopTest();
        
    }
}
