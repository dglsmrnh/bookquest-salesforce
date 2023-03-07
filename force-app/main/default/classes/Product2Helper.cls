public with sharing class Product2Helper {
    
    public static void setRecordType(List<Product2> newRecordList) {
        for(Product2 record: newRecordList) {
            record.RecordTypeId = getRecordTypeId(record.Family);
        }
    }

    private static Id getRecordTypeId(String name) {
        return Schema.SObjectType.Product2.getRecordTypeInfosByName().get(name).getRecordTypeId();
    }
}