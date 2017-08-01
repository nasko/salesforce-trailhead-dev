({
    doInit : function(component, event, helper) {
        // Retrieve contacts during component initialization
        helper.loadContacts(component);
    },

    handleSelect : function(component, event, helper) {
        var contacts = component.get("v.contacts");
        var contactList = component.get("v.contactList");

        //Get the selected option: "Referral", "Social Media", or "All"
        var selected = event.getSource().get("v.value");

        var filter = [];
        for (var i=0; i<contactList.length; i++){
            var c = contactList[i];
            if (selected != "All"){
                if(c.LeadSource == selected) {
                    filter[i] = c;
                }
            }
            else {
                   filter = contactList;
            }
        }
        //Set the filtered list of contacts based on the selected option
        component.set("v.contacts", filter);
        helper.updateTotal(component);
    }
})