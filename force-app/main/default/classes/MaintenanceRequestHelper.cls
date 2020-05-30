public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> toUpdateCases) {
        // TODO: Complete the method to update workorders
        List<Case> toInsertCases = new List<Case>();
        Set<Id> proIds = new Set<Id>();
        for (Case ca : toUpdateCases) {
            proIds.add(ca.Equipment__c);
        }
        Map<Id, Decimal> proIdCycle = new Map<Id, Decimal>();
        if (proIds.size() > 0) {
            proIdCycle = generateCycle(proIds,proIdCycle);
        }
        
        for (Case ca : toUpdateCases) {
            Case newCa = new Case();
            newCa.Type = 'Routine Maintenance';
            newCa.Vehicle__c = ca.Vehicle__c;
            newCa.Subject = '维修设备';
            newCa.Date_Reported__c = Date.today();
            newCa.Equipment__c = ca.Equipment__c;
            newCa.Origin = 'Phone';
            newCa.Status = 'New';
            newCa.Date_Due__c = getDueDate(ca,proIdCycle);

            toInsertCases.add(newCa);
        }

        if (toInsertCases.size() > 0) {
            INSERT toInsertCases;
        }
    }
    
    public static Map<Id,Decimal> generateCycle(Set<Id> proIds,Map<Id, Decimal> proIdCycle) {
        for (Product2 pro : [SELECT Id,Maintenance_Cycle__c FROM Product2 WHERE Id IN: proIds]) {
            proIdCycle.put(pro.Id, pro.Maintenance_Cycle__c);
        }

        return proIdCycle;
    }

    public static Date getDueDate(Case ca,Map<Id, Decimal> proIdCycle) {
        Date dt = null;
        if (proIdCycle.containsKey(ca.Equipment__c)) {
            dt = Date.today().addDays(Integer.valueOf(proIdCycle.get(ca.Equipment__c)));
        }

        return dt;
    }
    
}