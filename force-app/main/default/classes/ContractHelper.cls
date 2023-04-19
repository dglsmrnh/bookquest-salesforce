public with sharing class ContractHelper {
    
    private static Id getRecordTypeId(String name) {
        return Schema.SObjectType.Contract.getRecordTypeInfosByName().get(name).getRecordTypeId();
    }
}