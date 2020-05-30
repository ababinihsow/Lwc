@isTest
private class MaintenanceRequestHelperTest {
    @IsTest
    static void methodName(){
        Product2 pro = new Product2();
        pro.Maintenance_Cycle__c = 2;
        pro.Name = 'Test Pro';
        insert pro;

        Case ca = new Case();
        ca.Type = 'Repair';
        ca.Status = 'New';
        ca.Equipment__c = pro.Id;
        ca.Subject = 'Test';
        INSERT ca;

        ca.Status = 'Closed';
        UPDATE ca;
    }
}
