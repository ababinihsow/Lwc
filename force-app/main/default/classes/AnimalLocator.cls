public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http hp = new Http();
        HttpRequest hrq = new HttpRequest();
        hrq.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        hrq.setMethod('GET');
        
        HttpResponse hr = hp.send(hrq);
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(hr.getBody());
        Map<String,Object> animals = (Map<String,Object>)results.get('animal'); 
        String name = (String)animals.get('name');
        // System.debug(animals.get('name'));   
        return name;   
    }
}