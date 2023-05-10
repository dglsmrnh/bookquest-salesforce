@isTest
public class AccountTest {
	@TestSetup
    public static void makeData() {
        
        
    }
    
    @isTest
    public static void testContractInsertion() {
        Account acc = new Account();
        acc.Name = 'Account Tester 1';
        acc.UserName__c = 'salvadorArena123';
        acc.Senha__c = 'coxinha123';
        acc.Email__c = 'invalid.invalid@test.invalid';
        Database.insert(acc);

        List<Contract> contractList = [SELECT Id FROM Contract];

        System.assert(contractList.size() > 0);
    }

    @isTest
    public static void testContactInsertion() {
        Account acc = new Account();
        acc.Name = 'Account Tester 1';
        acc.UserName__c = 'salvadorArena123';
        acc.Senha__c = 'coxinha123';
        acc.Email__c = 'invalid.invalid@test.invalid';
        Database.insert(acc);

        List<Contact> contactList = [SELECT Id FROM Contact];

        System.assert(contactList.size() > 0);
    }
}