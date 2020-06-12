public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        List<Camping_Item__c> items = [SELECT Id,Name,Price__c,Packed__c,Quantity__c FROM Camping_Item__c];
        return items;
    }

    @AuraEnabled
    public static void saveItem(Camping_Item__c item){
        insert item;
    }
}
