public with sharing class ContactController {
    public ContactController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id,Name, Title, Phone, Email FROM Contact LIMIT 10];
    }
}
