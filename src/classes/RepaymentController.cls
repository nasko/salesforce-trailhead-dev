public with sharing class RepaymentController {
    @AuraEnabled
    public static List<RePayment__c> getRepayments() {
        return [
            Select Id, Name, Funding_Amount__c, Available_Amount__c, Return__c, Closing_Date__c
            from RePayment__c
            where Published__c = true AND Active__c = true AND Fundingo_Deleted__c = false
        ];
    }
}