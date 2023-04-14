public with sharing class BookCategoryHandler extends TriggerHandler{
    public BookCategoryHandler(System.TriggerOperation operation, List<BookCategory__c> newRecordList, List<BookCategory__c> oldRecordList, Map<Id, BookCategory__c> newMap, Map<Id, BookCategory__c> oldMap) {
        super(operation, newRecordList, oldRecordList, newMap, oldMap);
    }

    private static Boolean runTrigger = true;

    public static Boolean isTriggerEnabled(){
        return runTrigger;
    }

    public static Boolean enableTrigger(){
        return runTrigger = true;
    }

    public static Boolean disableTrigger(){
        return runTrigger = false;
    }

    public override void beforeInsert(){
        BookCategoryHelper.setExternalId((BookCategory__c[])newRecordList);
    }

    public override void afterInsert(){

    }

    public override void beforeUpdate(){
        BookCategoryHelper.setExternalId((BookCategory__c[])newRecordList);
    }

    public override void afterUpdate(){

    }

    public override void beforeDelete(){

    }

    public override void afterDelete(){

    }

}