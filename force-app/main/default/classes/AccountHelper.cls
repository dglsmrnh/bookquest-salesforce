public with sharing class AccountHelper {

    public static void createContractOnInsert(List<Account> newRecords) {
        List<Contract> contractList = new List<Contract>();
        
        for(Account acc : newRecords) {
            Contract contr = new Contract();
            contr.Status = 'Activated';
            contr.AccountId = acc.Id;
            contr.Description = String.valueOf(Label.AccountContract).replace('<Name>',acc.Name);
            
            Id recordTypeId = ContractHelper.getRecordTypeId('Free');

            if(!String.isNotEmpty(acc.Type)) {
                recordTypeId = ContractHelper.getRecordTypeId(acc.Type);
            }
            
            contr.RecordTypeId = recordTypeId;

            contractList.add(contr);
        }
        
        Database.insert(contractList);
    }
}