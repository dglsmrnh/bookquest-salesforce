trigger BookCategoryTrigger on BookCategory__c (before insert, after insert, before update, after update, before delete, after delete) {
    BookCategoryHandler handler = new BookCategoryHandler(
        Trigger.operationType,
        Trigger.new, 
        Trigger.old,
        Trigger.newMap, 
        Trigger.oldMap
    );
    
    if (BookCategoryHandler.isTriggerEnabled()) {
        handler.execute();
    }
}