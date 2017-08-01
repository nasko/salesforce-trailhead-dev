({
    fetchRepayments : function(cmp, event, helper) {
        var action = cmp.get("c.getRepayments");

        //Column data for the table
        var repaymentColumns = [
            {
                'label':'Task Name',
                'name':'Name',
                'type':'reference',
                'value':'Id',
                'resizeable':true
            },
            {
                'label':'Start Date',
                'name':'Start_Date__c',
                'type':'date'
            },
            {
                'label':'Due Date',
                'name':'Due_Date__c',
                'type':'date'
            },
            {
                'label':'Stage',
                'name':'Stage__c',
                'type':'string'
            }

        ];

        //Configuration data for the table to enable actions in the table
        var repaymentTableConfig = {
            "massSelect":true,
            "globalAction":[
                {
                    "label":"Add Task",
                    "type":"button",
                    "id":"addtask",
                    "class":"slds-button slds-button--neutral"
                },
                {
                    "label":"Complete Task",
                    "type":"button",
                    "id":"completetask",
                    "class":"slds-button slds-button--neutral"
                }
            ],
            "rowAction":[
                {
                    "label":"Edit",
                    "type":"url",
                    "id":"edittask"
                },
                {
                    "label":"Del",
                    "type":"url",
                    "id":"deltask"
                },
                {
                    "type":"menu",
                    "id":"actions",
                    "visible":function(task){
                        return task.Stage__c != "Completed"
                    },
                    "menuOptions": [{
                        "label":"Complete",
                        "id":"completeTask"
                    }]
                }
            ]
        };

        if(cmp.get("v.projectId")){

            action.setParams({
                "projectId":cmp.get("v.projectId")
            });

            action.setCallback(this,function(resp){
                var state = resp.getState();
                if(cmp.isValid() && state === 'SUCCESS'){
                    //pass the records to be displayed
                    cmp.set("v.repayments",resp.getReturnValue());

                    //pass the column information
                    cmp.set("v.repaymentColumns",repaymentColumns);
                    //pass the configuration of task table
                    cmp.set("v.repaymentTableConfig",repaymentTableConfig);

                    //initialize the datatable
                    cmp.find("repaymentTable").initialize({
                        "order":[0,"desc"]
                    });
                }
                else{
                    console.log(resp.getError());
                }
            });

            $A.enqueueAction(action);
        }
    }
 })