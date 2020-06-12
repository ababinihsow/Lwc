({
    clickCreateItem : function(component, event, helper) {
        var isFormValid = component.find("campingItemForm").reduce(function(isValid, inputCmp){
        	inputCmp.showHelpMessageIfInvalid();    	
            return isValid && inputCmp.get("v.validity").valid;
        });
        
        if (isFormValid) {
            
            var newCampingItem = component.get("v.newItem");
            helper.createItem(component,newCampingItem);
           
        }
    },

    doInit : function(component, event, helper) {
        var action = component.get('c.getItems');
        action.setCallback(this,function(response) {
            var items = response.getReturnValue();
            component.set('v.items',items);
        });
        $A.enqueueAction(action);
    },

    handleAddItem : function(component, event, helper) {
        var newItem = event.getParam('item');
        var action = component.get('c.saveItem');
        action.setParams({
            "item" : newCampingItem
        });
        action.setCallback(this,function(response) {
            if (response.getState() === 'SUCCESS') {
                var items = component.get("v.items");
                items.push(newItem);
                component.set("v.items",items);
            }
        });
        $A.enqueueAction(action);
    }
})
