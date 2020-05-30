@isTest
private class ParkLocatorTest {
    @IsTest
    static void methodName(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = '日本';
        ParkLocator.country(country);
    }
}