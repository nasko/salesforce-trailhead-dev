trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();
    
    for (Opportunity o : Trigger.New) {
        if(o.StageName == 'Closed Won') {
            taskList.add(new Task(Subject='Follow Up Test Task',
                                 WhatId=o.Id));
        }
    }

    if (taskList.size() > 0) {
        insert taskList;
    }
}