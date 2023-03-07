public with sharing class Product2Handler extends TriggerHandler{

    public Product2Handler(System.TriggerOperation operation, List<Product2> newRecordList, List<Product2> oldRecordList, Map<Id, Product2> newMap, Map<Id, Product2> oldMap) {
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
        Product2Helper.setRecordType((Product2[])newRecordList);
    }

    public override void afterInsert(){

    }

    public override void beforeUpdate(){
        Product2Helper.setRecordType((Product2[])newRecordList);
    }

    public override void afterUpdate(){

    }

    public override void beforeDelete(){

    }

    public override void afterDelete(){

    }

}