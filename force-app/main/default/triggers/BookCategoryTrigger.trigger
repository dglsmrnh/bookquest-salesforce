trigger BookCategoryTrigger on BookCategory__c (before insert, after insert, before update, after update, before delete, after delete) {
    Product2Handler handler = new Product2Handler(
        Trigger.operationType,
        Trigger.new, 
        Trigger.old,
        Trigger.newMap, 
        Trigger.oldMap
    );
    
    if (Product2Handler.isTriggerEnabled()) {
        handler.execute();
    }
}