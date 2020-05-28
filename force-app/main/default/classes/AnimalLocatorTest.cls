@isTest
public with sharing class AnimalLocatorTest {
    @IsTest
    static void methodName(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        AnimalLocator.getAnimalNameById(0);
        // Test.startTest();
        // Test.stopTest();
        
    }
}
