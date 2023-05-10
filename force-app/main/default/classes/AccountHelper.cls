public with sharing class AccountHelper {

    public static void createContractOnInsert(List<Account> newRecords) {
        List<Contract> contractList = new List<Contract>();
        
        for(Account acc : newRecords) {
            Contract contr = new Contract();
            contr.Status = 'Draft';
            contr.AccountId = acc.Id;
            contr.Description = String.valueOf(Label.AccountContract).replace('<Name>',acc.Name);
            
            Id recordTypeId = ContractHelper.getRecordTypeId('Free'); //

            if(String.isNotEmpty(acc.Type)) {
                recordTypeId = ContractHelper.getRecordTypeId(acc.Type);
            }
            
            contr.RecordTypeId = recordTypeId;

            contractList.add(contr);
        }
        
        Database.insert(contractList);
    }

    public static void createContactOnInsert(List<Account> newRecords) {
        List<Contact> contactList = new LIst<Contact>();

        for(Account acc : newRecords) {
            Contact cont = new Contact();
            if(acc.Name.contains(' ')) {
                String[] nameVector = acc.Name.split(' ');
                cont.FirstName = nameVector[0];
                cont.LastName = nameVector[nameVector.size() - 1];
            }
            else {
                cont.LastName = acc.Name;
            }
            cont.ExternalId__c = acc.Email__c; //Temporary fix for the trigger, decide what to put on next meeting
            contactList.add(cont);
        }

        Database.insert(contactList);
    }
}