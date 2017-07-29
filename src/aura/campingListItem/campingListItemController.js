({
	packItem : function(component, event, helper) {
		var campingItem = component.get("v.item", true);
        var btnClicked = event.getSource();
        
        campingItem.Packed__c = true;
        component.set("v.item", campingItem);
        
        btnClicked.set("v.disabled", true);
	}

})