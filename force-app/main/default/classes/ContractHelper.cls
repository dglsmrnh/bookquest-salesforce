public with sharing class ContractHelper {

    public static Id getRecordTypeId(String name) {
        return Schema.SObjectType.Contract.getRecordTypeInfosByName().get(name).getRecordTypeId();
    }
}