public with sharing class ParkLocator {
    public static String[] country(String country) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(country);
    }
}