({
    createItem : function(component,newCampingItem) {
        var action = component.get("c.saveItem");
        action.setParams({
            "campingItem" : newCampingItem
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var parsedCampingItem = JSON.parse(JSON.stringify(newCampingItem));
                console.log(JSON.parse(JSON.stringify(parsedCampingItem)), JSON.stringify(parsedCampingItem));
                var campingItems = JSON.parse(JSON.stringify(component.get("v.items")));
                campingItems.push(parsedCampingItem);
                component.set("v.items",campingItems);
                component.set("v.newItem", {'sobjectType': 'Camping_Item__c'})
            }
        });
        $A.enqueueAction(action);
    }
})
