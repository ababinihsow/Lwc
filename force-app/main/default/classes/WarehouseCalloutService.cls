public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    @Future(callout=true)
    public static void runWarehouseEquipmentSync() {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.
        Http ht = new Http();
        HttpRequest hrq = new HttpRequest();
        hrq.setEndpoint(WAREHOUSE_URL);
        hrq.setMethod('GET');
        HttpResponse hr = ht.send(hrq);    
        
        if (hr.getStatusCode() == 200) {
            List<ProObj> proObjs = (List<ProObj>)JSON.deserialize(hr.getBody(), List<ProObj>.class);
            List<Product2> proList = new List<Product2>();
            for (ProObj po : proObjs) {
                Product2 pro = new Product2();
                pro.Replacement_Part__c = po.replacement;
                pro.Cost__c = po.cost;
                pro.Name = po.name;
                pro.Maintenance_Cycle__c = po.maintenanceperiod;
                pro.Lifespan_Months__c = po.lifespan;
                pro.Warehouse_SKU__c = po.sku;
                pro.Current_Inventory__c = po.quantity;

                proList.add(pro);
            }

            if (proList.size() > 0) {
                upsert proList Warehouse_SKU__c;
            }
        }
    }

    public class ProObj {
        public String id;
        public Boolean replacement;
        public Decimal quantity;
        public String name;
        public Decimal maintenanceperiod;
        public Decimal lifespan;
        public Decimal cost;
        public String sku;
    }
}